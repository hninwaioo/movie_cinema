import 'package:movie_cinema/network/responses/get_credit_cast_response.dart';
import 'package:retrofit/http.dart';
import '../data/vos/movie_now_and_coming_soon/movie_vo.dart';
import 'api_constant.dart';
import 'package:dio/dio.dart';
import 'responses/get_movie_now_and_coming_soon_response.dart';
part 'the_movie_cinema_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheMovieCinemaApi{
  factory TheMovieCinemaApi(Dio dio) = _TheMovieCinemaApi;

  @GET(ENDPOINT_MOVIES)
  Future<MovieListResponse> getPlayingMovies(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
      );

  @GET(ENDPOINT_GET_NOW_PLAYING)
  Future<MovieListResponse> getNowPlayingMovies(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
      );

  @GET(ENDPOINT_GET_UPCOMING)
  Future<MovieListResponse> getComingSoonPlayingMovies(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
      );

  @GET(ENDPOINT_GET_NOW_COMING_SOON_PLAYING)
  Future<MovieListResponse> getNowComingSoonPlayingMovies(
      @Path("movie") String nowComing,
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
      );

  @GET("$ENDPOINT_GET_MOVIE_DETAILS/{movie_id}")
  Future<MovieVO> getMovieDetail(
      @Path("movie_id") String movieId,
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
      );

  @GET("$ENDPOINT_GET_MOVIE_CREDIT/{movie_id}/credits")
  Future<CreditCastResponse> getCreditCast(
      @Path("movie_id") String movieId,
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      );
}