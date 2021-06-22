import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/main.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:Inhouse/service/api/postNewCommunityService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestConfirm extends StatelessWidget {
  TestConfirm({Key key, this.newCommunityInfo}) : super(key: key);
  final NewCommunityInfo newCommunityInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.newCommunity(context),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(newCommunityInfo.toString()),
            context.select((NewCommunityInfo response) => response).isLoading
                ? LinearProgressIndicator()
                : ElevatedButton(
                    child: Text("submit"),
                    style: ElevatedButton.styleFrom(elevation: 16),
                    onPressed: () async {
                      print("submit");
                      await context
                          .read<PostNewCommunityService>()
                          .call(newCommunityInfo);
                      Navigator.pushAndRemoveUntil(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new MyApp()),
                          (_) => false);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
