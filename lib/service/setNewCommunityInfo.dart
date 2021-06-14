import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:Inhouse/model/tagList.dart';
import 'package:state_notifier/state_notifier.dart';

class SetNewCommunityInfo extends StateNotifier<NewCommunityInfo> {
  SetNewCommunityInfo() : super(NewCommunityInfo());

  void name(String name) {
    state = NewCommunityInfo(name: name);
    print("state" + state.toString());
  }

  void tagMasterList(TagList tagList) {
    state = NewCommunityInfo(tagList: tagList);
    print("state" + state.toString());
  }
}
