import 'package:movie_cinema/data/vos/user_data_vo.dart';
import 'package:movie_cinema/network/responses/get_banner_response.dart';
import 'package:movie_cinema/network/responses/get_checkout_response.dart';
import 'package:movie_cinema/network/responses/get_cinema_timeslots_response.dart';
import 'package:movie_cinema/network/responses/get_payment_type_response.dart';
import 'package:movie_cinema/network/responses/get_set_city_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../data/vos/checkout/post_checkout_data_vo.dart';
import 'api_constant.dart';
import 'responses/get_cinema_response.dart';
import 'responses/get_cities_response.dart';
import 'responses/get_config_response.dart';
import 'responses/get_otp_response.dart';
import 'responses/get_snack_categories_response.dart';
import 'responses/get_snack_response.dart';
import 'responses/user_success_token_response.dart';
part 'the_movie_cinema_auth_api.g.dart';

@RestApi(baseUrl: BASE_AUTH_URL_DIO)
abstract class TheMovieCinemaAuthApi{
  factory TheMovieCinemaAuthApi(Dio dio) = _TheMovieCinemaAuthApi;

  @POST(ENDPOINT_AUTH_POST_OTP)
  @FormUrlEncoded()
  Future<OTPResponse> getOTP(
      @Field("phone") String? phone
      );

  @POST(ENDPOINT_AUTH_PHONE)
  @FormUrlEncoded()
  Future<GetUserSuccessTokenResponse> signInWithPhoneNumber(
      @Field("phone") String? phone,
      @Field("otp") String? otp
      );

  @GET(ENDPOINT_BANNER_MOVIES)
  Future<BannerResponse> getBannerMovies();

  @GET(ENDPOINT_GET_CITIES)
  Future<CitiesResponse> getCities();

  @POST(ENDPOINT_CHOOSE_CITY)
  @FormUrlEncoded()
  Future<SetCityResponse> setCity(
      @Header(AUTHORIZATION) String token,
      @Field("city_id") int? cityId
      );

  @GET(ENDPOINT_GET_CONFIG)
  Future<ConfigResponse> getConfig();

  @GET(ENDPOINT_GET_CINEMA)
  Future<CinemaResponse> getCinemaList();

  @GET(ENDPOINT_GET_CINEMA_DAY_TIMESLOTS)
  Future<CinemaTimeslotsResponse> getCinemaDayTimeslots(
      @Header(AUTHORIZATION) String token,
      @Query(DATE) String date,
      );

  @GET(ENDPOINT_GET_SNACK_CATEGORIES)
  Future<SnackCategoriesResponse> getSnackCategories(
      @Header(AUTHORIZATION) String token
      );

  @GET(ENDPOINT_GET_SNACK)
  Future<SnackResponse> getAllSnack(
      @Header(AUTHORIZATION) String token
      );

  @GET(ENDPOINT_GET_SNACK)
  Future<SnackResponse> getCategoriesSnack(
      @Header(AUTHORIZATION) String token,
      @Query("category_id") int category_id
      );

  @GET(ENDPOINT_GET_PAYMENT)
  Future<PaymentTypeResponse> getPaymentType(
      @Header(AUTHORIZATION) String token,
      );

  @POST(ENDPOINT_CHECKOUT_PAYMENT)
  Future<CheckOutResponse> CheckOutPayment(
      @Header(AUTHORIZATION) String token,
      @Body() PostCheckOutDataVO postCheckOutDataVO
      );
}