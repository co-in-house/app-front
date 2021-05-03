import 'package:Inhouse/model/routingState.dart';
import 'package:Inhouse/util/util.dart';
import 'package:state_notifier/state_notifier.dart';

class ChangePage extends StateNotifier<RoutingState> {
  ChangePage() : super(RoutingState());

  void setHome() {
    print("routingState変更 : home");
    state = RoutingState(routingState: Const.rootingNoHome);
  }

  void setSearch() {
    print("routingState変更 : search");
    state = RoutingState(routingState: Const.rootingNoSearch);
  }
}
