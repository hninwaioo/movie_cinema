import 'package:flutter/material.dart';
import 'package:movie_cinema/data/model/movie_model.dart';
import 'package:movie_cinema/data/vos/banner_vo.dart';
import 'package:movie_cinema/data/vos/checkout/post_checkout_data_vo.dart';
import 'package:movie_cinema/data/vos/cinema_timeslots/cinema_data_vo.dart';
import 'package:movie_cinema/data/vos/cities_vo.dart';
import 'package:movie_cinema/data/vos/movie_now_and_coming_soon/credit_cast_vo.dart';
import 'package:movie_cinema/data/vos/payment_vo.dart';
import 'package:movie_cinema/data/vos/snack/snack_categories_vo.dart';
import 'package:movie_cinema/data/vos/snack/snack_vo.dart';
import 'package:movie_cinema/network/responses/get_checkout_response.dart';
import 'package:movie_cinema/network/responses/get_otp_response.dart';
import 'package:movie_cinema/network/responses/get_set_city_response.dart';
import 'package:movie_cinema/network/responses/user_success_token_response.dart';
import 'package:movie_cinema/persistence/daos/banner_dao.dart';
import 'package:movie_cinema/persistence/daos/categories_snack_dao.dart';
import 'package:movie_cinema/persistence/daos/cinema_dao.dart';
import 'package:movie_cinema/persistence/daos/cinema_timeslots_dao.dart';
import 'package:movie_cinema/persistence/daos/config_dao.dart';
import 'package:movie_cinema/persistence/daos/payment_dao.dart';
import 'package:movie_cinema/persistence/daos/snack_categories_dao.dart';
import 'package:movie_cinema/persistence/daos/snack_dao.dart';

import '../../network/movie_data_agent.dart';
import '../../network/retrofit_data_agent_impl.dart';
import '../../persistence/daos/city_dao.dart';
import '../../persistence/daos/movie_dao.dart';
import '../../persistence/daos/user_dao.dart';
import '../vos/cinema/cinema_vo.dart';
import '../vos/cinema_timeslots/config_data_vo.dart';
import '../vos/movie_now_and_coming_soon/movie_vo.dart';
import 'package:stream_transform/stream_transform.dart';


class MovieModelImpl extends MovieModel {

  String? token;
  MovieDataAgent mDataAgent = RetrofitDataAgentImpl();

  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  factory MovieModelImpl(){
    return _singleton;
  }

  MovieModelImpl._internal();

  /// Daos
  UserDao mUserDao = UserDao();

  CityDao mCityDao = CityDao();
  MovieDao mMovieDao = MovieDao();
  BannerDao mBannerDao = BannerDao();

  CategoriesSnackDao mCategoriesSnackDao = CategoriesSnackDao();
  SnackDao mSnackDao = SnackDao();
  SnackCategoriesDao mSnackCategoriesDao = SnackCategoriesDao();
  PaymentDao mPaymentDao = PaymentDao();

  CinemaDao mCinemaDao = CinemaDao();
  ConfigDao mConfigDao = ConfigDao();
  CinemaTimeslotsDao mCinemaTimeslotsDao = CinemaTimeslotsDao();


  @override
  Future<List<MovieVO>?> getPlayingMovies(int page) {
    return mDataAgent.getNowPlayingMovies(page);
  }

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
    return mDataAgent.getNowPlayingMovies(page)
        .then((movieList) async {
      List<MovieVO>? nowPlayingMovies = movieList?.map((movie){
        movie.isNowPlayingMovies = true;
        movie.isComingMovies = false;
        return movie;
      }).toList();
      mMovieDao.savedAllMovies(nowPlayingMovies??[]);
      // return Future.value(movieList);
    });
  }

  @override
  Future<List<MovieVO>?> getComingSoonPlayingMovies(int page) {
    return mDataAgent.getComingSoonPlayingMovies(page)
        .then((movieList) async {
          List<MovieVO>? comingMovies = movieList?.map((movie){
            movie.isNowPlayingMovies = false;
            movie.isComingMovies = true;
            return movie;
          }).toList();
          mMovieDao.savedAllMovies(comingMovies??[]);
      // return Future.value(movieList);
    });
  }

  @override
  Future<List<BannerVO>?> getBannerMovies() {
    return mDataAgent.getBannerMovies().then((bannerList) async {
      List<BannerVO>? bannerMovies = bannerList?.map((bannerMovie){
        return bannerMovie;
      }).toList();
      mBannerDao.savedAllBannerMovies(bannerMovies??[]);
      // return Future.value(bannerList);
    });
  }

  @override
  Future<List<MovieVO>?> getNowComingSoonPlayingMovies(String nowComing) {
    return mDataAgent.getNowComingSoonPlayingMovies(nowComing)
        .then((movieList) async{
          mMovieDao.savedAllMovies(movieList??[]);
          return Future.value(movieList);
    });
  }

  @override
  Future<MovieVO>? getMovieDetail(int movieId) {

    return mDataAgent.getMovieDetail(movieId)?.then((movie) async {
      mMovieDao.saveSingleMovie(movie);
      return Future.value(movie);
    });
  }

  @override
  Future<List<CreditCastVO>?> getCreditCast(int movieId) {
    return mDataAgent.getCreditCast(movieId);
  }

  @override
  Future<List<CitiesVO>?> getCities() {
    // return mDataAgent.getCities().then((cities) async{
    //   mCityDao.savedAllCities(cities??[]);
    //   return Future.value(cities);
    // });

    return mDataAgent.getCities().then((citiesList) async {
      List<CitiesVO>? cities = citiesList?.map((cities_List){
        return cities_List;
      }).toList();
      mCityDao.savedAllCities(cities??[]);
      // return Future.value(bannerList);
    });
  }

  @override
  Future<List<ConfigDataVO>?> getConfig() {
    return mDataAgent.getConfig()
        .asStream()
        .map((response) => response?.where((element) => element.key == "cinema_timeslot_status")
        .toList())
        .first;
  }

  @override
  Future<List<CinemaVO>?> getCinemaList() {
    return mDataAgent.getCinemaList();
  }

  @override
  Future<List<CinemaDataVO>?> getCinemaTimeslot(String token, String date){
    return mDataAgent.getCinemaTimeslot(token, date);
  }

  @override
  Future<List<SnackCategoriesVO>?> getSnackCategories(String token) {
    // return mDataAgent.getSnackCategories(token)
    // .then((snackCategoriesList) async {
    //   mSnackCategoriesDao.savedAllSnackCategories(snackCategoriesList??[]);
    //   return Future.value(snackCategoriesList);
    // });

    return mDataAgent.getSnackCategories(token).then((snackCategoriesList) async {
      List<SnackCategoriesVO>? snackCategories = snackCategoriesList?.map((snack_Categories){
        return snack_Categories;
      }).toList();
      mSnackCategoriesDao.savedAllSnackCategories(snackCategories??[]);
      // return Future.value(bannerList);
    });
  }

  @override
  Future<List<SnackVO>?> getAllSnack(String token) {
    return mDataAgent.getAllSnack(token)
        .then((snackList) async {
          List<SnackVO>? allSnacks = snackList?.map((allSnackList){
            return allSnackList;
          }).toList();
          mSnackDao.savedAllSnacks(allSnacks??[]);
          // return Future.value(snackList);
    });
  }

  @override
  Future<List<SnackVO>?> getCategoriesSnack(String token, int category_id) {
    return mDataAgent.getCategoriesSnack(token, category_id)
        .then((categoriesSnackList) async {
          mCategoriesSnackDao.savedAllCategoriesSnack(categoriesSnackList??[]);
          return Future.value(categoriesSnackList);
    });
  }

  @override
  Future<List<PaymentVO>?> getPaymentType(String token) {
    return mDataAgent.getPaymentType(token)
        .then((paymentList) async {
          mPaymentDao.savedAllPaymentTypes(paymentList??[]);
          return Future.value(paymentList);
    });
  }

  @override
  Future<SetCityResponse>? setCity(String token, int cityId) {
    return mDataAgent.setCity(token,cityId);

    // return mDataAgent.setCity(token,cityId)?.then((cityName) async {
    //   mCityDao.savedCityName(cityName.);
    //   return Future.value(movie);
    // });
  }

  @override
  Future<CheckOutResponse>? CheckOutPayment(String token, PostCheckOutDataVO postCheckOutDataVO) {
    return mDataAgent.CheckOutPayment(token, postCheckOutDataVO);
  }

  /// Login
  @override
  Future<OTPResponse>? getOTP(String phone) {
    return mDataAgent.getOTP(phone);
  }

  @override
  Future<GetUserSuccessTokenResponse>? signInWithPhoneNumber(String phone, String otp) {
    return mDataAgent.signInWithPhoneNumber(phone, otp)
    ?.then((userData){
      token = userData.token;
      mUserDao.saveUserData(userData);
      return userData;
    });
  }


  @override
  Future<GetUserSuccessTokenResponse>? signInWithPhoneNumberFromDatabase(int code) {
    return Future.value(mUserDao.getUserData(code));
  }

/// DATABASE

  @override
  Stream<List<CitiesVO>?> getCitiesFromDatabase() {
    // return Future.value(mCityDao.getAllCities());
    this.getCities();
    return mCityDao
        .getAllCitiesListEventStream()
        .startWith(mCityDao.getAllCitiesListStream())
        .map((event) => mCityDao.getAllCitiesListStream());
  }

  // @override
  // Future<List<MovieVO>?> getComingSoonPlayingMoviesFromDatabase() {
  //   return Future.value(mMovieDao.getAllMovies());
  // }

  @override
  Stream<List<MovieVO>?> getComingSoonPlayingMoviesFromDatabase() {
    this.getComingSoonPlayingMovies(1);
    return mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getComingSoonMoviesStream())
        .map((event) => mMovieDao.getComingSoonMoviesStream());
  }

  @override
  Stream<List<MovieVO>?> getNowPlayingMoviesFromDatabase() {
    // return Future.value(mMovieDao.getAllMovies());
    this.getNowPlayingMovies(1);
    return mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getNowPlayingMoviesStream())
        .map((event) => mMovieDao.getNowPlayingMoviesStream());
  }

  @override
  Stream<List<BannerVO>?> getBannerMoviesFromDatabase() {
    // return Future.value(mBannerDao.getAllBannerMovies());
    this.getBannerMovies();
    return mBannerDao
        .getAllBannerMoviesEventStream()
        .startWith(mBannerDao.getBannerMoviesStream())
        .map((event) => mBannerDao.getBannerMoviesStream());
  }

  @override
  Future<MovieVO> getMovieDetailsFromDatabase(int movieId) {
    return Future.value(mMovieDao.getMovieById(movieId));
  }

  @override
  Future<List<SnackCategoriesVO>?> getSnackCategoryFromDatabase() {
    return Future.value(mSnackCategoriesDao.getAllSnackCategories());
    // this.getSnackCategories(token);
    // return mSnackCategoriesDao
    //     .getAllSnackCategoriesListEventStream()
    //     .startWith(mSnackCategoriesDao.getAllSnackCategoriesListStream())
    //     .map((event) => mSnackCategoriesDao.getAllSnackCategoriesListStream());
  }

  @override
  Future<List<SnackVO>?> getAllSnackFromDatabase() {
    return Future.value(mSnackDao.getAllSnacks());
    // this.getAllSnack(token);
    // return mSnackDao
    //     .getAllSnackListEventStream()
    //     .startWith(mSnackDao.getAllSnackListStream())
    //     .map((event) => mSnackDao.getAllSnackListStream());
  }

  @override
  Future<List<SnackVO>?> getCategoriesSnackFromDatabase() {
    return Future.value(mCategoriesSnackDao.getAllCategoriesSnack());
    // this.getCategoriesSnack(token, category_id);
    // return mCategoriesSnackDao
    //     .getAllCategoriesSnackEventStream()
    //     .startWith(mCategoriesSnackDao.getAllCategoriesSnackStream())
    //     .map((event) => mCategoriesSnackDao.getAllCategoriesSnackStream());

  }

  @override
  Stream<List<PaymentVO>?> getPaymentTypesFromDatabase(String token) {
    // return Future.value(mPaymentDao.getAllPaymentTypes());
    this.getPaymentType(token);
    return mPaymentDao
        .getAllPaymentListEventStream()
        .startWith(mPaymentDao.getAllPaymentListStream())
        .map((event) => mPaymentDao.getAllPaymentListStream());
  }

  @override
  Stream<List<CinemaVO>?> getCinemaListFromDatabase() {
    // return Future.value(mCinemaDao.getAllCinemas());
    this.getCinemaList();
    return mCinemaDao
        .getAllCinemasListEventStream()
        .startWith(mCinemaDao.getAllCinemasListStream())
        .map((event) => mCinemaDao.getAllCinemasListStream());
  }

  @override
  Future<List<CinemaDataVO>?> getCinemaTimeslotFromDatabase() {
    return Future.value(mCinemaTimeslotsDao.getCinemaTimeslots());
  }

  @override
  Stream<List<ConfigDataVO>?> getConfigFromDatabase() {
   // return Future.value(mConfigDao.getConfig());
    this.getConfig();
    return mConfigDao
        .getConfigEventStream()
        .startWith(mConfigDao.getConfigStream())
        .map((event) => mConfigDao.getConfigStream());
  }

}
