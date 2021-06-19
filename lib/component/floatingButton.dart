import 'package:Inhouse/model/locationList.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:Inhouse/model/tagList.dart';
import 'package:Inhouse/view/newCommunityPage/newCommunityPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomFloatingButton extends StatelessWidget {
  final NewCommunityInfo newCommunityInfo = new NewCommunityInfo();

  @override
  Widget build(BuildContext context) {
    newCommunityInfo.tagList = context.select((TagList tagList) => tagList);
    newCommunityInfo.locationList =
        context.select((LocationList locationList) => locationList);
    print("build CustomFloatingButton");
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
                        // MaterialPageRoute(
                        //   builder: (context) => NewCommunityNamePage(
                        //       newCommunityInfo: newCommunityInfo),
                        // ),
                        MaterialPageRoute(
                            builder: (context) => NewCommunityPage(
                                  newCommunityInfo: newCommunityInfo,
                                )));
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
