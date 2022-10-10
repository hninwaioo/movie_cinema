import 'package:movie_cinema/data/vos/banner_vo.dart';
import 'package:movie_cinema/data/vos/movie_now_and_coming_soon/credit_cast_vo.dart';
import 'package:movie_cinema/data/vos/snack/snack_categories_vo.dart';
import 'package:movie_cinema/network/responses/get_cinema_response.dart';
import 'package:movie_cinema/network/responses/get_cinema_timeslots_response.dart';
import 'package:movie_cinema/network/responses/get_config_response.dart';
import '../../network/responses/get_checkout_response.dart';
import '../../network/responses/get_otp_response.dart';
import '../../network/responses/user_success_token_response.dart';
import '../vos/checkout/post_checkout_data_vo.dart';
import '../vos/cities_vo.dart';
import '../vos/movie_now_and_coming_soon/movie_vo.dart';
import '../vos/payment_vo.dart';
import '../vos/snack/snack_vo.dart';
import '../../network/responses/get_set_city_response.dart';


abstract class MovieModel {

  Future<List<MovieVO>?> getPlayingMovies(int page);
  Future<List<MovieVO>?> getNowPlayingMovies(int page);
  Future<List<MovieVO>?> getComingSoonPlayingMovies(int page);
  Future<List<MovieVO>?> getNowComingSoonPlayingMovies(String nowComing);
  Future<MovieVO>? getMovieDetail(int movieId);
  Future<List<CreditCastVO>?> getCreditCast(int movieId);

  Future<List<BannerVO>?> getBannerMovies();

  /// Auth ENDPOINT
  Future<List<CitiesVO>?> getCities();

  Future<SetCityResponse>? setCity(String token, int cityId);

  Future<ConfigResponse>? getConfig();
  Future<CinemaResponse>? getCinemaList();
  Future<CinemaTimeslotsResponse>? getCinemaTimeslot(String token, String date);
  Future<List<SnackCategoriesVO>?> getSnackCategories(String token);
  Future<List<SnackVO>?> getAllSnack(String token);
  Future<List<SnackVO>?> getCategoriesSnack(String token, int category_id);
  Future<List<PaymentVO>?> getPaymentType(String token);

  Future<CheckOutResponse>? CheckOutPayment(String token, PostCheckOutDataVO postCheckOutDataVO);

  /// Login ENDPOINT
  Future<OTPResponse>? getOTP(String phone);

  Future<GetUserSuccessTokenResponse>? signInWithPhoneNumber(String phone, String otp);

}