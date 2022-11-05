import 'package:hive/hive.dart';

import '../../data/vos/cinema_timeslots/config_data_vo.dart';
import '../hive_constants.dart';

class ConfigDao {

  static final ConfigDao _singleton = ConfigDao._internal();

  factory ConfigDao(){
    return _singleton;
  }

  ConfigDao._internal();

  void savedAllCinemas(List<ConfigDataVO> configList) async {
    Map<int, ConfigDataVO> configMap = Map.fromIterable(configList,
        key: (config) => config.id, value: (cinema) => cinema);
    await getConfigBox().putAll(configMap);
  }

  List<ConfigDataVO> getAllConfig(){
    if(getConfig() != null && (getConfig().isNotEmpty)){
      return getConfig().toList();
    }else {
      return[];
    }
  }

  Stream<List<ConfigDataVO>> getConfigStream(){
    return Stream.value(getConfig()
        .toList());
  }

  Stream<void> getConfigEventStream(){
    return getConfigBox().watch();
  }

  List<ConfigDataVO> getConfig(){
    return getConfigBox().values.toList();
  }

  Box<ConfigDataVO> getConfigBox(){
    return Hive.box<ConfigDataVO>(BOX_NAME_CONFIG_DATA_VO);
  }

}