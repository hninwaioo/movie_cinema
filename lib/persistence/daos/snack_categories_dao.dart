import 'package:hive/hive.dart';
import 'package:movie_cinema/data/vos/snack/snack_categories_vo.dart';
import 'package:movie_cinema/persistence/hive_constants.dart';

class SnackCategoriesDao {

  static final SnackCategoriesDao _singleton = SnackCategoriesDao._internal();

  factory SnackCategoriesDao(){
    return _singleton;
  }

  SnackCategoriesDao._internal();

  void savedAllSnackCategories(List<SnackCategoriesVO> snackCategoriesList) async {
    Map<int, SnackCategoriesVO> snackCategoriesMap = Map.fromIterable(snackCategoriesList,
        key: (snackCategories) => snackCategories.id, value: (snackCategories) => snackCategories);
    await getSnackCategoriesBox().putAll(snackCategoriesMap);
  }

  List<SnackCategoriesVO> getAllSnackCategoriesList(){
    if(getAllSnackCategories() != null && getAllSnackCategories().isNotEmpty){
      return getAllSnackCategories().toList();
    }else{
      return[];
    }
  }

  Stream<List<SnackCategoriesVO>> getAllSnackCategoriesListStream(){
    return Stream.value(getAllSnackCategories()
        .toList());
  }

  Stream<void> getAllSnackCategoriesListEventStream(){
    return getSnackCategoriesBox().watch();
  }

  List<SnackCategoriesVO> getAllSnackCategories(){
    return getSnackCategoriesBox().values.toList();
  }

  Box<SnackCategoriesVO> getSnackCategoriesBox(){
    return Hive.box<SnackCategoriesVO>(BOX_NAME_SNACK_CATEGORY_VO);
  }

}