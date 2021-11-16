import 'package:flutter/material.dart';
import 'package:inhouse/component/appBar/search/SearchHistoryAB.dart';

class SearchHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchHistoryAB.build(context),
      body: Column(
        children: [
          ListTile(leading: Icon(Icons.history), title: Text("こんな感じで履歴出すんじゃね")),
          ListTile(leading: Icon(Icons.history), title: Text("知らんけど")),
          ListTile(
              leading: Icon(Icons.search_rounded),
              title: Text("履歴以外になんかあったっけ")),
          ListTile(
              leading: Icon(Icons.grade, color: Colors.pink),
              title: Text("アイコンの色変えてみた")),
          ListTile(
            leading: Icon(Icons.grade),
            title: Text(
              "文字の色変えてみた",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.history, color: Colors.grey),
            title: Text("要件考えまっしょう"),
            subtitle: Text("ここのsub1行はいらんか"),
            trailing: Icon(Icons.more_vert),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
