import 'package:Inhouse/service/user/userService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("========LoginPage build========");
    final Size mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: mediaSize.height,
        width: mediaSize.width,
        child: Column(
          children: [
            Container(
              height: mediaSize.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage('images/cf01.jpg'),
                ),
              ),
            ),
            Container(
              width: mediaSize.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      "God is really only another artist. He invented the giraffe, the elephant and the cat. He has no real style, He just goes on trying other things.",
                      style: TextStyle(
                          color: Colors.grey, fontStyle: FontStyle.italic),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 2),
                    alignment: Alignment.topRight,
                    child: Text(
                      "- Pablo Ruiz Picasso",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("すぐに始める"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.topRight,
                              child: SignInButton(
                                Buttons.Google,
                                onPressed: () => print("google"),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: SignInButton(
                                Buttons.Facebook,
                                onPressed: () => print("facebook"),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: SignInButton(
                                Buttons.Twitter,
                                onPressed: () => print("twitter"),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: SignInButton(
                                Buttons.Tumblr,
                                text: "テスト",
                                onPressed: () =>
                                    context.read<UserService>().login(),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
