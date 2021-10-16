import 'dart:convert';
import 'package:Inhouse/model/event/attendee/attendees.dart';
import 'package:state_notifier/state_notifier.dart';

class GetAttendeesService extends StateNotifier<Attendees> {
  GetAttendeesService() : super(Attendees());

  // 取得
  Future<void> call() async {
    print("GetAttendeesService Call");
    state = Attendees(
      isLoading: true,
    );
    // テスト用
    await new Future.delayed(new Duration(seconds: 1));
    final response = _MockResponse();

    if (response.statusCode == 200) {
      print("GetAttendeesService Response: 200");
      Attendees attendees = Attendees.fromJson(jsonDecode(response.body));
      state = attendees;
    } else {
      throw Exception('Failed to get Attendees');
    }
  }
}

class _MockResponse {
  int get statusCode => _statusCode;
  String get body => _body;

  int _statusCode = 200;
  String _body = '''{
        "communityId":9999,
        "eventId":9999,
        "list": [ 
        {  
        "isOrganizer": true,
        "isSubscriber": true,
        "url": "https://64.media.tumblr.com/0317820d16f6aa4dfb218964540d5ca2/8e115be96e0d0f3e-ff/s1280x1920/d1605a5ea98ad3136f1e6ab435fd76757fc12609.jpg",
        "userName": "今野陽太"
        },
        {  
        "isOrganizer": false,
        "isSubscriber": true,
        "url": "https://64.media.tumblr.com/e065a50ec0e02c5cfbc33273c4d0a502/e14429f11b30162b-88/s1280x1920/33f30ae6b12bf806d9791ead916e91933de193de.jpg",
        "userName": "加入済み太郎"
        },
        {  
        "isOrganizer": false,
        "isSubscriber": true,
        "url": "https://64.media.tumblr.com/f3549bc0507982b3b1753c2e3f3930f8/d55773cd29b07d7e-ec/s2048x3072/cf8046ca4f57c3f93895baa24d99e46efe5e4e23.jpg",
        "userName": "加入済み太郎"
        },
        {  
        "isOrganizer": false,
        "isSubscriber": true,
        "url": "https://64.media.tumblr.com/fbb7ad9cdb59b5966132f538e87ed22e/55aefaf90388dd79-8a/s1280x1920/58b115e57674cc46a0c26a24b8d0c1d1afb6b7e3.jpg",
        "userName": "加入済み太郎"
        },
        {  
        "isOrganizer": false,
        "isSubscriber": false,
        "url": "https://64.media.tumblr.com/fbb7ad9cdb59b5966132f538e87ed22e/55aefaf90388dd79-8a/s1280x1920/58b115e57674cc46a0c26a24b8d0c1d1afb6b7e3.jpg",
        "userName": "加入してないマン"
        },
        {  
        "isOrganizer": false,
        "isSubscriber": false,
        "url": "https://64.media.tumblr.com/f7a320f8004362aad8b02dd3321f4740/2617694217fcd36b-09/s400x600/69786b0ab17882cef8dd4812c189fbdc6bada0de.jpg",
        "userName": "加入してないマン"
        },
        {  
        "isOrganizer": false,
        "isSubscriber": false,
        "url": "https://64.media.tumblr.com/914ad3871d55317e4559c4e32443bfa9/tumblr_pdxxo66Wxh1qdjgwno1_500.jpg",
        "userName": "加入してないマン"
        },
        {  
        "isOrganizer": false,
        "isSubscriber": false,
        "url": "https://64.media.tumblr.com/1a8efe720bdc0e8211d89fb08fe4980c/tumblr_pfewnok7ta1xsf642o1_400.jpg",
        "userName": "加入してないマン"
        },
        {  
        "isOrganizer": false,
        "isSubscriber": false,
        "url": "https://64.media.tumblr.com/0317820d16f6aa4dfb218964540d5ca2/8e115be96e0d0f3e-ff/s1280x1920/d1605a5ea98ad3136f1e6ab435fd76757fc12609.jpg",
        "userName": "加入してないマン"
        }
      ]
    }''';
}
