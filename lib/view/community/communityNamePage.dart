import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:Inhouse/view/community/communityTagPage.dart';
import 'package:flutter/material.dart';

class CommunityNamePage extends StatefulWidget {
  CommunityNamePage() : super();

  @override
  _CommunityNameState createState() => _CommunityNameState();
}

class _CommunityNameState extends State<CommunityNamePage> {
  final TextEditingController _controller = TextEditingController();
  final String testState = "testStateValue";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarCommunity.name(context),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
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
                  hintText: "Enter your community name",
                ),
                onSubmitted: (String inputName) {
                  print("submitted : " + inputName);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: Text("Submit"),
                    style: ElevatedButton.styleFrom(
                      elevation: 16,
                    ),
                    onPressed: () {
                      print("controller.text : " + this._controller.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CommunityTagPage(
                                  argument: this._controller.text,
                                )),
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
