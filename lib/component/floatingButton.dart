import 'package:Inhouse/view/community/communityNamePage.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        print("pressed floatingActionButton");
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('title'),
              content: Text('content'),
              // backgroundColor: Color.fromARGB(100, 255, 255, 255),
              actions: <Widget>[
                ElevatedButton(
                  child: Text("コミュニティ作成"),
                  style: ElevatedButton.styleFrom(
                    elevation: 16,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommunityNamePage()),
                    );
                  },
                ),
                ElevatedButton(
                  child: Text("CANCEL"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 16,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
