import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:Inhouse/util/util.dart';
import 'package:Inhouse/view/newCommunity/newCommunityTagPage.dart';
import 'package:flutter/material.dart';

class NewCommunityNamePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  NewCommunityNamePage({this.newCommunityInfo});
  final NewCommunityInfo newCommunityInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarCommunity.name(context),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width *
              Const.containerWidthPercentage,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: this._controller,
                decoration: new InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.sentiment_satisfied_alt,
                        color: inhouseThemeColor.primaryColor),
                    onPressed: null,
                  ),
                  hintText: "コミュニテイ名を入力",
                ),
                onSubmitted: (String inputName) {
                  print("submitted : " + inputName);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: Text("次へ"),
                    style: ElevatedButton.styleFrom(
                      elevation: 16,
                    ),
                    onPressed: () {
                      newCommunityInfo.name = this._controller.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewCommunityTagPage(
                              newCommunityInfo: newCommunityInfo),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
