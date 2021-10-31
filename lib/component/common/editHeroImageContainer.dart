import 'package:flutter/material.dart';
import 'package:inhouse/util/dataQuery.dart';

class EditHeroImageContainer extends StatelessWidget {
  const EditHeroImageContainer({
    Key key,
    @required @required this.imgUrl,
  }) : super(key: key);
  final String imgUrl;
  final double _radius = 25;

  @override
  Widget build(BuildContext context) {
    final String defaultImgPath = EventImageDataQuery.getDefaultImgRandom();
    String targetImagePath = "";
    return Card(
      elevation: 30.0,
      shadowColor: Colors.black,
      margin: EdgeInsets.only(
        top: 0,
        bottom: MediaQuery.of(context).size.width * 0.1,
        left: 0,
        right: 0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(_radius),
          bottomRight: Radius.circular(_radius),
        ),
      ),
      child: Container(
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(_radius),
            bottomRight: Radius.circular(_radius),
          ),
          image: DecorationImage(
            image: this.imgUrl == null
                ? AssetImage(defaultImgPath)
                : NetworkImage(this.imgUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
