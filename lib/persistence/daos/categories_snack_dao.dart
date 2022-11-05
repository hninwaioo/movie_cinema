import 'package:hive/hive.dart';
import 'package:movie_cinema/data/vos/snack/snack_vo.dart';
import 'package:movie_cinema/persistence/hive_constants.dart';

class CategoriesSnackDao {

  static final CategoriesSnackDao _singleton = CategoriesSnackDao._internal();

  factory CategoriesSnackDao(){
    return _singleton;
  }

  CategoriesSnackDao._internal();

  void savedAllCategoriesSnack(List<SnackVO> categoriesSnackList) async {
    Map<int, SnackVO> categoriesSnackMap = Map.fromIterable(categoriesSnackList,
        key: (categoriesSnack) => categoriesSnack.id, value: (categoriesSnack) => categoriesSnack);
    await getCategoriesSnackBox().putAll(categoriesSnackMap);
  }

  List<SnackVO> getAllCategoriesSnackList(){
    if(getAllCategoriesSnack() != null && getAllCategoriesSnack().isNotEmpty){
      return getAllCategoriesSnack().toList();
    }else{
      return[];
    }
  }

  Stream<List<SnackVO>> getAllCategoriesSnackStream(){
    return Stream.value(getAllCategoriesSnack()
        .toList());
  }

  Stream<void> getAllCategoriesSnackEventStream(){
    return getCategoriesSnackBox().watch();
  }

  List<SnackVO> getAllCategoriesSnack(){
    return getCategoriesSnackBox().values.toList();
  }

  Box<SnackVO> getCategoriesSnackBox(){
    return Hive.box<SnackVO>(BOX_NAME_CATEGORIES_SNACK_VO);
  }
}