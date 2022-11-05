import 'package:hive/hive.dart';

import '../../data/vos/cities_vo.dart';
import '../hive_constants.dart';

class CityDao {
  static final CityDao _singleton = CityDao._internal();

  factory CityDao(){
    return _singleton;
  }

  CityDao._internal();

  void savedAllCities(List<CitiesVO> actorList) async {
    Map<int, CitiesVO> cityMap = Map.fromIterable(actorList,
        key: (actor) => actor.id, value: (actor) => actor);
    await getCityBox().putAll(cityMap);
  }

  List<CitiesVO> getAllCitiesList(){
    if(getAllCities() != null && getAllCities().isNotEmpty){
      return getAllCities().toList();
    }else{
      return[];
    }
  }

  Stream<List<CitiesVO>> getAllCitiesListStream(){
    return Stream.value(getAllCities()
        .toList());
  }

  Stream<void> getAllCitiesListEventStream(){
    return getCityBox().watch();
  }

  List<CitiesVO> getAllCities(){
    return getCityBox().values.toList();
  }

  void savedCityName (CitiesVO? citiesVO) async{
    return getCityBox().put(citiesVO?.id,citiesVO!);
  }

  CitiesVO? getCityName(int cityId) {
    return getCityBox().get(cityId);
  }

  Box<CitiesVO> getCityBox(){
    return Hive.box<CitiesVO>(BOX_NAME_CITY_VO);
  }

}