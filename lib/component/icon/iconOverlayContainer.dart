import 'package:Inhouse/util/modal.dart';
import 'package:flutter/material.dart';

class IconOverLayContainer extends StatelessWidget {
  const IconOverLayContainer({Key key, @required this.size}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    final double _diffPos = size * 0.8;
    return InkWell(
      onTap: () async {
        await attendeeModal(context: context, content: Container());
      },
      child: Container(
        height: size,
        width: size * 4 - _diffPos / 3,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                child: _IconContainer(
                    size: size,
                    url:
                        "https://64.media.tumblr.com/d2c3635d2168c2374a39c762e915c53d/31414909f6529090-da/s2048x3072/aeeee4aeba3d1f30ba5ef6674a284d7b75c9df1a.png"),
              ),
              left: 0,
            ),
            Positioned(
              child: Container(
                child: _IconContainer(
                    size: size,
                    url:
                        "https://64.media.tumblr.com/2febe678b5305c0cc1560d6b1406049a/e76b2b99fe8497c5-f1/s2048x3072/f620d308ae4f45c88d65216ba81db5996c8e50e4.jpg"),
              ),
              left: _diffPos,
            ),
            Positioned(
              child: Container(
                child: _IconContainer(
                    size: size,
                    url:
                        "https://64.media.tumblr.com/3d6d9e2bcc94c6a605791747b656d29f/07e02d0da28d6185-62/s2048x3072/bd3b2946cfbf48b440d2a82f4640ad032831fdb1.jpg"),
              ),
              left: _diffPos * 2,
            ),
            Positioned(
              child: Container(
                child: _MoreInfoContainer(size: size),
              ),
              left: _diffPos * 3,
            ),
          ],
        ),
      ),
    );
  }
}

class _IconContainer extends StatelessWidget {
  const _IconContainer({
    Key key,
    @required this.size,
    @required this.url,
  }) : super(key: key);
  final String url;
  final double size;
  final double _horizontalMargin = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: _horizontalMargin, vertical: 0),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
          image: NetworkImage(this.url),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        // border: Border.all(color: Colors.green, width: 1.0),
      ),
    );
  }
}

class _MoreInfoContainer extends StatelessWidget {
  const _MoreInfoContainer({
    Key key,
    @required this.size,
  }) : super(key: key);
  final double size;
  final double _horizontalMargin = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: _horizontalMargin, vertical: 0),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.green[400],
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        // border: Border.all(color: Colors.green, width: 1.0),
      ),
      child: Icon(
        Icons.more_horiz,
        color: Colors.white,
      ),
    );
  }
}
