import 'package:Inhouse/view/community/choosingCommunity.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NextPage()),
        );

        /*
        print("pressed floatingActionButton");
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Container(
                width: 10,
                height: 10,
                color: Colors.lightGreen[200],
              ),
              backgroundColor: Colors.lightGreen[200],
              actions: <Widget>[
                ElevatedButton(
                  child: Text("btn"),
                  style: ElevatedButton.styleFrom(
                    elevation: 16,
                    shape: const CircleBorder(),
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
        */
      },
    );
  }
}
