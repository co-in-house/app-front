import 'dart:convert';
import 'package:inhouse/model/community/JoinedCommunity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:state_notifier/state_notifier.dart';

class GetJoinedCommunityListService extends StateNotifier<JoinedCommunityList> {
  GetJoinedCommunityListService() : super(JoinedCommunityList());

  void call({@required num userid}) async {
    state = JoinedCommunityList(
      contentsList: state.contentsList,
      isLoading: true,
    );
    final response = await http.get(
      Uri.https(
          'app-service.au-syd.mybluemix.net', 'service/api/community/joined', {
        "userid": userid.toString() // for test
      }),
    );

    if (response.statusCode == 200) {
      print("200");

      JoinedCommunityList joinedCommunityList = JoinedCommunityList.fromJson(
        jsonDecode(
          utf8.decode(
            response.body.runes.toList(),
          ),
        ),
      );
      state = JoinedCommunityList(
        contentsList: joinedCommunityList.contentsList,
        isLoading: false,
      );
    } else {
      print("status : " + response.statusCode.toString());
      throw Exception('Failed to Get JoinedCommunity');
    }
  }
}
