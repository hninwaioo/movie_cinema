import 'package:hive/hive.dart';
import 'package:movie_cinema/data/vos/snack/snack_vo.dart';

import '../hive_constants.dart';

class SnackDao {
  static final SnackDao _singleton = SnackDao._internal();

  factory SnackDao(){
    return _singleton;
  }

  SnackDao._internal();

  void savedAllSnacks(List<SnackVO> snackList) async {
    Map<int, SnackVO> snackMap = Map.fromIterable(snackList,
        key: (snack) => snack.id, value: (snack) => snack);
    await getSnackBox().putAll(snackMap);
  }

  List<SnackVO> getAllSnackList(){
    if(getAllSnacks() != null && getAllSnacks().isNotEmpty){
      return getAllSnacks().toList();
    }else{
      return[];
    }
  }

  Stream<List<SnackVO>> getAllSnackListStream(){
    return Stream.value(getAllSnacks()
        .toList());
  }

  Stream<void> getAllSnackListEventStream(){
    return getSnackBox().watch();
  }

  List<SnackVO> getAllSnacks(){
    return getSnackBox().values.toList();
  }

  Box<SnackVO> getSnackBox(){
    return Hive.box<SnackVO>(BOX_NAME_SNACK_VO);
  }
}