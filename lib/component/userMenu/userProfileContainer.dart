import 'package:inhouse/component/icon/iconContainer.dart';
import 'package:flutter/material.dart';

class UserProfileContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20),
      child: Column(
        children: [
          Container(
            child: IconContainer(
                size: 200,
                url:
                    'https://66.media.tumblr.com/c063f0b98040e8ec4b07547263b8aa15/tumblr_inline_ppignaTjX21s9on4d_540.jpg'),
          ),
          Container(
            child: Text(
              "漢字カナかなalpha",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Text(
              "@yota0913",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
