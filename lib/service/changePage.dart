import 'package:inhouse/model/routingState.dart';
import 'package:state_notifier/state_notifier.dart';

class ChangePage extends StateNotifier<RoutingState> {
  ChangePage() : super(RoutingState());

  void set(int index) {
    print("routingState変更 : " + index.toString());
    state = RoutingState(routingState: index);
  }
}
