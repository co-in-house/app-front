import 'package:inhouse/model/lounge/roomState.dart';
import 'package:state_notifier/state_notifier.dart';

class ChangeRoom extends StateNotifier<RoomState> {
  ChangeRoom() : super(RoomState());

  void set(int index, int communityId, String roomName, String communityName) {
    print(
        "chat room変更 : $index, id : $communityId, name : $communityName, roomName : $roomName");
    state = RoomState(
      index: index,
      communityId: communityId,
      communityName: communityName,
      roomName: roomName,
    );
  }

  void close() {
    print("close chat room");
    state = RoomState(index: 0);
  }
}
