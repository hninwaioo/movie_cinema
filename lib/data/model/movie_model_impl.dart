import 'package:movie_cinema/data/model/movie_model.dart';
import 'package:movie_cinema/data/vos/banner_vo.dart';
import 'package:movie_cinema/data/vos/checkout/post_checkout_data_vo.dart';
import 'package:movie_cinema/data/vos/cities_vo.dart';
import 'package:movie_cinema/data/vos/movie_now_and_coming_soon/credit_cast_vo.dart';
import 'package:movie_cinema/data/vos/payment_vo.dart';
import 'package:movie_cinema/data/vos/snack/snack_categories_vo.dart';
import 'package:movie_cinema/data/vos/snack/snack_vo.dart';
import 'package:movie_cinema/network/responses/get_checkout_response.dart';
import 'package:movie_cinema/network/responses/get_cinema_response.dart';
import 'package:movie_cinema/network/responses/get_config_response.dart';
import 'package:movie_cinema/network/responses/get_otp_response.dart';
import 'package:movie_cinema/network/responses/get_set_city_response.dart';
import 'package:movie_cinema/network/responses/user_success_token_response.dart';
import 'package:movie_cinema/pages/cinema_detail_view_page.dart';

import '../../network/movie_data_agent.dart';
import '../../network/responses/get_cinema_timeslots_response.dart';
import '../../network/retrofit_data_agent_impl.dart';
import '../vos/movie_now_and_coming_soon/movie_vo.dart';

class MovieModelImpl extends MovieModel {

  String? token;
  MovieDataAgent mDataAgent = RetrofitDataAgentImpl();

  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  factory MovieModelImpl(){
    return _singleton;
  }

  MovieModelImpl._internal();

  @override
  Future<List<MovieVO>?> getPlayingMovies(int page) {
    return mDataAgent.getNowPlayingMovies(page);
  }

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
    return mDataAgent.getNowPlayingMovies(page);
  }

  @override
  Future<List<MovieVO>?> getComingSoonPlayingMovies(int page) {
    return mDataAgent.getComingSoonPlayingMovies(page);
  }

  @override
  Future<List<BannerVO>?> getBannerMovies() {
    return mDataAgent.getBannerMovies();
  }

  @override
  Future<List<MovieVO>?> getNowComingSoonPlayingMovies(String nowComing) {
    return mDataAgent.getNowComingSoonPlayingMovies(nowComing);
  }

  @override
  Future<MovieVO>? getMovieDetail(int movieId) {
    return mDataAgent.getMovieDetail(movieId);
  }

  @override
  Future<List<CreditCastVO>?> getCreditCast(int movieId) {
    return mDataAgent.getCreditCast(movieId);
  }

  @override
  Future<List<CitiesVO>?> getCities() {
    return mDataAgent.getCities();
  }

  @override
  Future<ConfigResponse>? getConfig() {
    return mDataAgent.getConfig();
  }

  @override
  Future<CinemaResponse>? getCinemaList() {
    return mDataAgent.getCinemaList();
  }

  @override
  Future<CinemaTimeslotsResponse>? getCinemaTimeslot(String token, String date){
    return mDataAgent.getCinemaTimeslot(token, date);
  }

  @override
  Future<List<SnackCategoriesVO>?> getSnackCategories(String token) {
    return mDataAgent.getSnackCategories(token);
  }

  @override
  Future<List<SnackVO>?> getAllSnack(String token) {
    return mDataAgent.getAllSnack(token);
  }

  @override
  Future<List<SnackVO>?> getCategoriesSnack(String token, int category_id) {
    return mDataAgent.getCategoriesSnack(token, category_id);
  }

  @override
  Future<List<PaymentVO>?> getPaymentType(String token) {
    return mDataAgent.getPaymentType(token);
  }

  @override
  Future<SetCityResponse>? setCity(String token, int cityId) {
    return mDataAgent.setCity(token,cityId);
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
    ?.then((value){
      token = value.token;
      return value;
    });
  }

}
