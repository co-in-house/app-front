import 'package:Inhouse/component/community/communityInfoCardList.dart';
import 'package:flutter/material.dart';

class CommunityNoteCard extends CommunityBaseCard {
  CommunityNoteCard({this.note});
  final String note;

  String getSentence(String note) {
    if (note.isEmpty || note.trim() == null || note.trim() == '') {
      return "未入力";
    } else {
      return note;
    }
  }

  @override
  Widget buildChild(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Text("備考"), Text(getSentence(this.note))],
    );
  }
}
