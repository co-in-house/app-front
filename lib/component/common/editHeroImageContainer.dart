import 'package:flutter/material.dart';

class EditHeroImageContainer extends StatelessWidget {
  const EditHeroImageContainer({
    Key key,
    @required this.networkImgUrl,
    @required this.assetImgPath,
  }) : super(key: key);
  final String networkImgUrl;
  final String assetImgPath;
  final double _radius = 25;

  @override
  Widget build(BuildContext context) {
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
            image: this.networkImgUrl == null
                ? AssetImage(this.assetImgPath)
                : NetworkImage(this.networkImgUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
