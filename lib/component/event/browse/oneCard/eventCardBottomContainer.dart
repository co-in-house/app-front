import 'package:Inhouse/component/icon/communityIconContainer.dart';
import 'package:flutter/material.dart';

class EventCardBottomContainer extends StatelessWidget {
  const EventCardBottomContainer({
    Key key,
    this.title,
    this.date,
    this.maxMemberOfMember,
    this.totalMemberOfMember,
    this.height,
    this.communityName,
  }) : super(key: key);
  final String communityName;
  final String title;
  final String date;
  final int maxMemberOfMember;
  final int totalMemberOfMember;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Text(
            this.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: CommunityIconContainer(
                size: 45,
                url:
                    "https://pbs.twimg.com/media/DptRhNTUcAAILew?format=jpg&name=large",
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "軽音楽同好会",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "オンライン | 12:00-19:00 | 12人",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // EventJoinButtonContainer(),
            Container(
                child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[700],
            )),
          ],
        ),
      ],
    );
  }
}
