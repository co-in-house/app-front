import 'package:Inhouse/util/util.dart';
import 'package:flutter/material.dart';

class DetailHeroImageContainer extends StatelessWidget {
  const DetailHeroImageContainer(
      {Key key, @required this.imgUrl, @required this.heroTag})
      : super(key: key);
  final String imgUrl;
  final String heroTag;
  final double _radius = 25;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: this.heroTag,
      child: Card(
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
              image: NetworkImage(this.imgUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
