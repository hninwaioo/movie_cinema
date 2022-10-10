import 'package:dio/dio.dart';
import 'package:movie_cinema/data/vos/banner_vo.dart';
import 'package:movie_cinema/data/vos/checkout/post_checkout_data_vo.dart';
import 'package:movie_cinema/data/vos/cities_vo.dart';
import 'package:movie_cinema/data/vos/movie_now_and_coming_soon/credit_cast_vo.dart';
import 'package:movie_cinema/data/vos/payment_vo.dart';
import 'package:movie_cinema/data/vos/snack/snack_categories_vo.dart';
import 'package:movie_cinema/data/vos/snack/snack_vo.dart';
import 'package:movie_cinema/network/responses/get_checkout_response.dart';
import 'package:movie_cinema/network/responses/get_cinema_response.dart';
import 'package:movie_cinema/network/responses/get_cinema_timeslots_response.dart';
import 'package:movie_cinema/network/responses/get_config_response.dart';
import 'package:movie_cinema/network/responses/get_otp_response.dart';
import 'package:movie_cinema/network/responses/get_set_city_response.dart';
import 'package:movie_cinema/network/responses/user_success_token_response.dart';
import 'package:movie_cinema/network/the_movie_cinema_api.dart';
import 'package:movie_cinema/network/the_movie_cinema_auth_api.dart';

import '../data/vos/movie_now_and_coming_soon/movie_vo.dart';
import '../data/vos/user_data_vo.dart';
import 'api_constant.dart';
import 'movie_data_agent.dart';

class RetrofitDataAgentImpl extends MovieDataAgent{
  late TheMovieCinemaApi mApi;
  late TheMovieCinemaAuthApi mAuthApi;
  late TheMovieCinemaAuthApi mCheckOutApi;

  String? token= "14677|TBdKG0ByjbrAmkHX3317oN1aMljYh1nZK1Ug5M86";
  String? mToken;
  UserDataVO? _userDataVO;
  ConfigResponse? _configResponse;
  CinemaResponse? _cinemaResponse;

  static final RetrofitDataAgentImpl _singleton = RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl(){
    return _singleton;
  }


  RetrofitDataAgentImpl._internal(){
    final dio = Dio();
    mApi = TheMovieCinemaApi(dio);
    mAuthApi = TheMovieCinemaAuthApi(dio);

    final dioCheckOut = Dio(
      BaseOptions(
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
        headers: {
          HEADER_REQUESTED_WITH: XML_HTTP_REQUEST,
        },
      ),
    );

    mCheckOutApi = TheMovieCinemaAuthApi(dioCheckOut);
  }

  @override
  Future<List<MovieVO>?> getPlayingMovies(int page) {
    return mApi.getPlayingMovies(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }
  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
    return mApi.getNowPlayingMovies(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<MovieVO>?> getComingSoonPlayingMovies(int page) {
    return mApi.getComingSoonPlayingMovies(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<MovieVO>?> getNowComingSoonPlayingMovies(String nowComing) {
    return mApi.getNowComingSoonPlayingMovies(nowComing,API_KEY, LANGUAGE_EN_US, 1.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }


  @override
  Future<MovieVO>? getMovieDetail(int movieId) {
    return mApi.getMovieDetail(movieId.toString(), API_KEY, LANGUAGE_EN_US, 1.toString())
        .asStream()
        .map((response) => response)
        .first;
  }

  @override
  Future<List<CreditCastVO>?> getCreditCast(int movieId) {
    return mApi.getCreditCast(movieId.toString(), API_KEY, LANGUAGE_EN_US)
        .asStream()
        .map((response) => response.castList)
        .first;
  }

  @override
  Future<List<BannerVO>?> getBannerMovies(){
    return mAuthApi.getBannerMovies()
        .asStream()
        .map((response) => response.bannerList)
        .first;
  }

  @override
  Future<List<CitiesVO>?> getCities() {
    return mAuthApi.getCities()
        .asStream()
        .map((response) => response.citiesList)
        .first;
  }

  @override
  Future<SetCityResponse>? setCity(String token, int cityId) {
    return mAuthApi.setCity(token, cityId)
        .asStream()
        .map((response) => response)
        .first;
  }

  @override
  Future<ConfigResponse>? getConfig() {
    return mAuthApi.getConfig()
        .then((config){
          _configResponse = config;
          print("ConfigResponse==>${_configResponse}");
          return config;
    });
  }

  @override
  Future<CinemaResponse>? getCinemaList() {
    return mAuthApi.getCinemaList()
        .then((cinema){
          _cinemaResponse = cinema;
          print("CinemaResponse==>${_cinemaResponse}");
          return cinema;
    });
  }

  @override
  Future<CinemaTimeslotsResponse>? getCinemaTimeslot(String token, String date) {
    return mAuthApi.getCinemaDayTimeslots(token, date)
        .then((cinemaTimeslots){
          print("CinemaTimeSlots=>${cinemaTimeslots}");
          return cinemaTimeslots;
    });
  }

  @override
  Future<List<SnackCategoriesVO>?> getSnackCategories(String token) {
    return mAuthApi.getSnackCategories(token)
        .asStream()
        .map((response) => response.snackCategoriesList)
        .first;
    }

  @override
  Future<List<SnackVO>?> getAllSnack(String token) {
    return mAuthApi.getAllSnack(token)
        .asStream()
        .map((response) => response.snackList)
        .first;
  }

  @override
  Future<List<SnackVO>?> getCategoriesSnack(String token, int category_id) {
    return mAuthApi.getCategoriesSnack(token, category_id)
        .asStream()
        .map((response) => response.snackList)
        .first;
  }

  @override
  Future<List<PaymentVO>?> getPaymentType(String token) {
    return mAuthApi.getPaymentType(token)
        .asStream()
        .map((response) => response.paymentList)
        .first;
  }

  @override
  Future<CheckOutResponse>? CheckOutPayment(String token, PostCheckOutDataVO postCheckOutDataVO) {

    return mCheckOutApi.CheckOutPayment(token,postCheckOutDataVO)
        .asStream()
        .map((response) => response)
        .first;
  }

  @override
  Future<OTPResponse>? getOTP(String phone) {
    return mAuthApi.getOTP(phone)
        .asStream()
        .map((response) => response)
        .first;
  }

  @override
  Future<GetUserSuccessTokenResponse>? signInWithPhoneNumber(String phone, String otp) {
    return mAuthApi.signInWithPhoneNumber(phone, otp)
        .then((user) {
      mToken = user.token;
      print("Token==>${mToken}");
      _userDataVO = user.userData;
      print("UserData==>${_userDataVO}");
      return user;
    } );
        // ?.asStream()
        // .map((response) => response)
        // .first;

  }

}