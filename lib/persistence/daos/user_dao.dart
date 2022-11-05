import 'package:hive/hive.dart';
import '../../data/vos/user_data_vo.dart';
import '../../network/responses/user_success_token_response.dart';
import '../hive_constants.dart';

class UserDao {

  static final UserDao _singleton = UserDao._internal();

  factory UserDao(){
    return _singleton;
  }

  UserDao._internal();

  void saveUserData(GetUserSuccessTokenResponse userData) async {
    return getUserDataBox().put(userData.code, userData);
  }

  // GetUserSuccessTokenResponse getUserData(){
  //   return getUserDataBox().values.first;
  // }

  GetUserSuccessTokenResponse? getUserData (int code) {
    return getUserDataBox().get(code);
  }

  GetUserSuccessTokenResponse? getUserToken () {
    return getUserDataBox().get(1);
  }

  Box<GetUserSuccessTokenResponse> getUserDataBox(){
    return Hive.box<GetUserSuccessTokenResponse>(BOX_NAME_USER_DATA_TOKEN_VO);
  }

}