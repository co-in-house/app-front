import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';

class NewCommunityNotePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  NewCommunityNotePage({this.newCommunityInfo});
  final NewCommunityInfo newCommunityInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.newCommunity(context),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width *
              Const.containerWidthPercentage,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                autocorrect: false,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                controller: this._controller,
                decoration: new InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.sentiment_satisfied_alt,
                        color: inhouseThemeColor.primaryColor),
                    onPressed: null,
                  ),
                  hintText: "備考を入力",
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
                      newCommunityInfo.note = this._controller.text;
                      print(newCommunityInfo);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => NewCommunityIconPage(),
                      //   ),
                      // );
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
