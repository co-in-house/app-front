import 'package:Inhouse/model/lounge/roomState.dart';
import 'package:state_notifier/state_notifier.dart';

class ChangeRoom extends StateNotifier<RoomState> {
  ChangeRoom() : super(RoomState());

  void set(int index) {
    print("room変更 : " + index.toString());
    state = RoomState(index: index);
  }
}
