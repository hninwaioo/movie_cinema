import 'package:hive/hive.dart';
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

  Stream<List<MovieVO>> getNowPlayingMoviesStream(){
    return Stream.value(getAllMovies()
        .where((element) => element.isNowPlayingMovies ?? false)
        .toList());
  }

  List<MovieVO> getNowPlayingMovies(){
    if(getAllMovies() != null && (getAllMovies().isNotEmpty)){
      return getAllMovies()
          .where((element) => element.isNowPlayingMovies?? false)
          .toList();
    }else {
      return[];
    }
  }

  Stream<List<MovieVO>> getComingSoonMoviesStream(){
    return Stream.value(getAllMovies()
        .where((element) => element.isNowPlayingMovies ?? false)
        .toList());
  }

  List<MovieVO> getComingSoonMovies(){
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