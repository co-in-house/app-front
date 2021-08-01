import 'package:flutter/material.dart';

class CutContainer extends StatelessWidget {
  const CutContainer({Key key, @required this.img}) : super(key: key);
  final String img;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/' + img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          top: 0,
          left: 0,
          right: 0,
          bottom: 0),
      Positioned(
        child: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.symmetric(
              vertical: 4,
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start, // これで両端に寄せる
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/' + img),
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  'ジョルジョ・ジョッバーナ',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 0.0,
                blurRadius: 10.0,
              ),
            ],
          ),
        ),
        bottom: 0,
        left: 0,
        right: 0,
      ),
    ]);
  }
}
