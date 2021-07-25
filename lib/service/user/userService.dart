import 'package:Inhouse/model/userState.dart';
import 'package:state_notifier/state_notifier.dart';

class UserService extends StateNotifier<UserState> {
  UserService() : super(UserState());

  void login() {
    print("login!");
    state = UserState(isLogined: true);
  }

  void logout() {
    print("logout!");
    state = UserState(isLogined: false);
  }
}
