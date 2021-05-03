import 'package:Inhouse/model/rootingState.dart';
import 'package:Inhouse/util/util.dart';
import 'package:state_notifier/state_notifier.dart';

class ChangePage extends StateNotifier<RootingState> {
  ChangePage() : super(RootingState());

  void setHome() {
    print("RootingState変更 : home");
    state = RootingState(rootingState: Const.rootingNoHome);
  }

  void setSearch() {
    print("RootingState変更 : search");
    state = RootingState(rootingState: Const.rootingNoSearch);
  }
}
