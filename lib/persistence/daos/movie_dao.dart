import 'package:hive/hive.dart';
import 'package:http/http.dart';

import '../../data/vos/movie_now_and_coming_soon/movie_vo.dart';
import '../hive_constants.dart';

class MovieDao {

  static final MovieDao _singleton = MovieDao._internal();

  factory MovieDao(){
    return _singleton;
  }

  MovieDao._internal();

  void savedAllMovies(List<MovieVO> movieList) async {
    Map<int, MovieVO> movieMap = Map.fromIterable(movieList,
        key: (movie) => movie.id, value: (movie) => movie);
    await getMovieBox().putAll(movieMap);
  }

  Stream<void> getAllMoviesEventStream(){
    return getMovieBox().watch();
  }

  List<MovieVO> getNowPlayingMoviesStream(){
    if(getAllMovies() != null && (getAllMovies().isNotEmpty)){
      return getAllMovies()
          .where((element) => element.isNowPlayingMovies?? false)
          .toList();
    }else {
      return[];
    }
  }

  List<MovieVO> getComingSoonMoviesStream(){
    if(getAllMovies() != null && (getAllMovies().isNotEmpty)){
      return getAllMovies()
          .where((element) => element.isComingMovies?? false)
          .toList();
    }else {
      return[];
    }
  }

  void saveSingleMovie(MovieVO movie) async {
    return getMovieBox().put(movie.id, movie);
  }

  List<MovieVO> getAllMovies(){
    return getMovieBox().values.toList();
  }

  MovieVO? getMovieById (int movieId) {
    return getMovieBox().get(movieId);
  }

  Box<MovieVO> getMovieBox(){
    return Hive.box<MovieVO>(BOX_NAME_MOVIE_VO);
  }

}