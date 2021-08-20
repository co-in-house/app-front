import 'package:Inhouse/component/community/communityInfoListDelegate.dart';
import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';

class CommunityOpenChatRow extends CommunityBaseContainer {
  @override
  Widget buildChild(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 120,
          height: 120,
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.green,
            image: DecorationImage(
              image: NetworkImage(
                  'https://64.media.tumblr.com/9a9d46b72b6bbb18a142009b187b299f/cc2e3564ab15f9bf-fa/s2048x3072/1056d390f6bab346d3ea57a5210aa48ff4465941.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "絶賛オープンチャット開催中な感じのタイトル",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "2020年7月10日13:00 - ",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      print("onPressed!");
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 3.0,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: CustomColor.linearGradient(1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          '参加する',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
