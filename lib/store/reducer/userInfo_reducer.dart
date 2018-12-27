import 'package:redux/redux.dart';
import '../../modal/user_info.dart' show UserInfo;
final UserInfoReducer = combineReducers<UserInfo>(
  [
    TypedReducer<UserInfo,UserInfoAction>(_fresh),
  ]
);
UserInfo _fresh(UserInfo userInfo, UserInfoAction acton){
  userInfo = acton.userInfo;
  return userInfo;
}
class UserInfoAction {
  final userInfo;
  UserInfoAction(this.userInfo);
}