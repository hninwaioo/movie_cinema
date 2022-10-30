import 'package:hive/hive.dart';
import 'package:movie_cinema/data/vos/cinema_timeslots/cinema_data_vo.dart';
import 'package:movie_cinema/persistence/hive_constants.dart';

class CinemaTimeslotsDao {

  static final CinemaTimeslotsDao _singleton = CinemaTimeslotsDao._internal();

  factory CinemaTimeslotsDao(){
    return _singleton;
  }

  CinemaTimeslotsDao._internal();

  void savedAllCinemaTimeslots(List<CinemaDataVO> cinemaTimeslotsList) async {
    Map<int, CinemaDataVO> cinemaTimeslotsMap = Map.fromIterable(cinemaTimeslotsList,
        key: (cinemaTimeslots) => cinemaTimeslots.id, value: (cinemaTimeslots) => cinemaTimeslots);
    await getCinemaTimeslotsBox().putAll(cinemaTimeslotsMap);
  }

  List<CinemaDataVO> getCinemaTimeslots(){
    return getCinemaTimeslotsBox().values.toList();
  }

  Box<CinemaDataVO> getCinemaTimeslotsBox(){
    return Hive.box<CinemaDataVO>(BOX_NAME_CINEMA_DATA_VO);
  }

}