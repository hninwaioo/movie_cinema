import 'package:hive/hive.dart';
import 'package:movie_cinema/data/vos/cinema/cinema_vo.dart';
import 'package:movie_cinema/persistence/hive_constants.dart';

class CinemaDao {
  static final CinemaDao _singleton = CinemaDao._internal();

  factory CinemaDao(){
    return _singleton;
  }

  CinemaDao._internal();

  void savedAllCinemas(List<CinemaVO> cinemaList) async {
    Map<int, CinemaVO> cinemaMap = Map.fromIterable(cinemaList,
        key: (cinema) => cinema.id, value: (cinema) => cinema);
    await getCinemaBox().putAll(cinemaMap);
  }

  List<CinemaVO> getAllCinemasListStream(){
    if(getAllCinemas() != null && getAllCinemas().isNotEmpty){
      return getAllCinemas().toList();
    }else{
      return[];
    }
  }

  Stream<void> getAllCinemasListEventStream(){
    return getCinemaBox().watch();
  }

  List<CinemaVO> getAllCinemas(){
    return getCinemaBox().values.toList();
  }

  void saveSingleMovie(CinemaVO cinemaVO) async {
    return getCinemaBox().put(cinemaVO.id, cinemaVO);
  }

  CinemaVO? getCinemaById (int cinemaId) {
    return getCinemaBox().get(cinemaId);
  }

  Box<CinemaVO> getCinemaBox(){
    return Hive.box<CinemaVO>(BOX_NAME_CINEMA_VO);
  }

}