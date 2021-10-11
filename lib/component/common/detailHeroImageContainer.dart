import 'package:flutter/material.dart';

class DetailHeroImageContainer extends StatelessWidget {
  const DetailHeroImageContainer(
      {Key key, @required this.imgUrl, @required this.heroTag})
      : super(key: key);
  final String imgUrl;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: this.heroTag,
      child: Container(
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(this.imgUrl),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
