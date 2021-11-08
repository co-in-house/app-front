import 'package:inhouse/component/icon/communityIconContainer.dart';
import 'package:flutter/material.dart';

class EventCardBottomContainer extends StatelessWidget {
  const EventCardBottomContainer({
    Key key,
    this.communityName,
    this.iconImg,
    this.title,
    this.location,
    this.startTime,
    this.endTime,
  }) : super(key: key);
  final String communityName;
  final String iconImg;
  final String title;
  final String location;
  final String startTime;
  final String endTime;

  static final TextStyle _textStyle = TextStyle(
      color: const Color(0xFFFCFCFC),
      fontWeight: FontWeight.normal,
      shadows: shadows);
  static final List<Shadow> shadows = [
    Shadow(
      offset: Offset(0.0, 0.0),
      blurRadius: 10.0,
      color: Colors.black,
    )
  ];

  static final double _subContentMargin = 10.0;

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
              color: const Color(0xFFFCFCFC),
              fontSize: 18,
              fontWeight: FontWeight.bold,
              shadows: shadows,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: _subContentMargin),
              child: CommunityIconContainer(
                size: 45,
                url: this.iconImg,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      this.communityName,
                      style: _textStyle,
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            this.location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: _textStyle,
                          ),
                        ),
                        Text(
                          " | " + this.startTime + " - " + this.endTime,
                          style: _textStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // EventJoinButtonContainer(),
            Container(
                margin: EdgeInsets.only(left: _subContentMargin),
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
