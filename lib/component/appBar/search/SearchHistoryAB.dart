import 'package:flutter/material.dart';

class SearchHistoryAB {
  static AppBar build(BuildContext context) {
    return AppBar(
      title: TextField(
        onChanged: (text) {
          debugPrint("$text");
        },
        autofocus: true,
        autocorrect: false,
        decoration: const InputDecoration(
            suffixIcon: const Icon(Icons.search), hintText: "コミュニティを検索しよう"),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
