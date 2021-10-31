import 'dart:convert';
import 'package:inhouse/model/cutList.dart';
import 'package:state_notifier/state_notifier.dart';

// Cut Service class
class GetCutListService extends StateNotifier<CutList> {
  GetCutListService() : super(CutList());

  // 取得
  Future<void> call() async {
    print("GetCutListService Call");
    state = CutList(
      contentsList: state.contentsList,
      isLoading: true,
    );
    // テスト用
    await new Future.delayed(new Duration(seconds: 1));
    final response = _MockResponse();
    print("response status: " + response.statusCode.toString());
    if (response.statusCode == 200) {
      print("GetCutListService Response: 200");
      print("resoibse body: " + response.body);
      CutList cutList = CutList.fromJson(
        jsonDecode(
          response.body,
          // utf8.decode(
          //   response.body.runes.toList(),
          // ),
        ),
      );
      state = cutList;
    } else {
      throw Exception('Failed to get CutList');
    }
  }
}

class _MockResponse {
  int get statusCode => _statusCode;
  int _statusCode = 200;
  String get body {
    return jsonEncode({
      'cutList': [
        {
          'communityId': 1,
          'communityName': 'テスト1',
          'description': '動画の説明文章をここに書いてはどうだろうか。そして長くても対応したい',
          'iconUrl':
              'https://firebasestorage.googleapis.com/v0/b/com-inhouse-app.appspot.com/o/images%2Ficon%2Fjojo.jpg?alt=media',
          'videoUrl':
              'https://firebasestorage.googleapis.com/v0/b/com-inhouse-app.appspot.com/o/cuts%2Fcut01.MP4?alt=media',
        },
        {
          'communityId': 2,
          'communityName': 'テスト2',
          'description': 'This is decsription.',
          'iconUrl':
              'https://firebasestorage.googleapis.com/v0/b/com-inhouse-app.appspot.com/o/images%2Ficon%2Fjojo2.jpg?alt=media',
          'videoUrl':
              'https://firebasestorage.googleapis.com/v0/b/com-inhouse-app.appspot.com/o/cuts%2Fcut02.MP4?alt=media',
        },
        {
          'communityId': 3,
          'communityName': 'テスト3',
          'description': 'ここは説明文',
          'iconUrl':
              'https://firebasestorage.googleapis.com/v0/b/com-inhouse-app.appspot.com/o/images%2Ficon%2Fjojo3.jpg?alt=media',
          'videoUrl':
              'https://firebasestorage.googleapis.com/v0/b/com-inhouse-app.appspot.com/o/cuts%2Fcut03.MP4?alt=media',
        }
      ],
    });
  }
}
