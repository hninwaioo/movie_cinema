import 'package:hive/hive.dart';
import 'package:movie_cinema/data/vos/banner_vo.dart';
import 'package:movie_cinema/persistence/hive_constants.dart';

class BannerDao {

  static final BannerDao _singleton = BannerDao._internal();

  factory BannerDao(){
    return _singleton;
  }

  BannerDao._internal();

  void savedAllBannerMovies(List<BannerVO> bannerList) async {
    Map<int, BannerVO> bannerMap = Map.fromIterable(bannerList,
        key: (actor) => actor.id, value: (actor) => actor);
    await getBannerBox().putAll(bannerMap);
  }

  List<BannerVO> getBannerMoviesStream(){
    if(getAllBannerMovies() != null && getAllBannerMovies().isNotEmpty){
      return getAllBannerMovies()
          .toList();
    }else{
      return[];
    }
  }
  Stream<void> getAllBannerMoviesEventStream(){
    return getBannerBox().watch();
  }
  List<BannerVO> getAllBannerMovies(){
    return getBannerBox().values.toList();
  }

  Box<BannerVO> getBannerBox(){
    return Hive.box<BannerVO>(BOX_NAME_BANNER_VO);
  }
}