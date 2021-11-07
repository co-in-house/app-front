import 'package:inhouse/model/baseModel.dart';

class SaveEventInfo extends BaseModel {
  SaveEventInfo({
    this.iconImgUrl,
    this.eventId,
    this.targetImgPath,
    this.title,
    this.start,
    this.end,
    this.location,
    this.communityId,
    this.description,
    this.isLoading = false,
  });
  bool isLoading;
  int eventId;
  String iconImgUrl;
  String targetImgPath;
  String title;
  String start;
  String end;
  String location;
  int communityId;
  String description;

  @override
  String toString() {
    return {
      'eventId': this.eventId,
      'communityId': this.communityId,
      'title': this.title,
      'start': this.start,
      'end': this.end,
      'location': this.location,
      'description': this.description,
      'thumbnailImg': this.iconImgUrl,
    }.toString();
  }

  Map<String, Object> toJson() {
    return {
      'eventId': this.eventId,
      'communityId': this.communityId,
      'title': this.title,
      'start': this.start,
      'end': this.end,
      'location': this.location,
      'description': this.description,
      'thumbnailImg': this.iconImgUrl,
    };
  }
}
