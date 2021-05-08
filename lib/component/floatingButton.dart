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
                  child: Text("CANCEL"),
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
