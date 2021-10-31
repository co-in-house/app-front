import 'package:inhouse/component/lounge/roomGrid.dart';
import 'package:flutter/material.dart';

class CommunityLine extends StatelessWidget {
  const CommunityLine({
    Key key,
    this.communityName,
  }) : super(key: key);
  final String communityName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              '@' + this.communityName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0),
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Divider(
              color: Colors.grey,
              height: 0,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(0.0),
            alignment: Alignment.center,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('images/hero.jpg'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0),
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Divider(
              color: Colors.grey,
              height: 0,
            ),
          ),
          RoomGrid(),
        ],
      ),
    );
  }
}
