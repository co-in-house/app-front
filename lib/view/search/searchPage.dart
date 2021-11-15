import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("========SearchPage build========");
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: TextField(
              cursorColor: Colors.green,
              style: const TextStyle(
                color: Colors.black,
              ),
              maxLines: 1,
              autofocus: true,
              autocorrect: false,
              enabled: true,
              obscureText: false,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                errorStyle: TextStyle(color: Colors.red),
                errorMaxLines: 1,
                border: InputBorder.none,
                counterText: '',
                hintText: 'コミュニティを検索しよう',
                hintStyle: TextStyle(
                  height: 0.4,
                  color: Colors.green,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
