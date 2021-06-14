import 'package:Inhouse/model/tagList.dart';

class NewCommunityInfo {
  NewCommunityInfo({
    this.name,
    this.tagList,
    this.content,
  });
  String name;
  TagList tagList;
  String content;

  @override
  String toString() {
    return {'name': this.name, 'tagList': this.tagList, 'content': this.content}
        .toString();
  }
}
