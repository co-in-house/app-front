import 'package:flutter/material.dart';

class IconOverLayContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 50,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                child: TestIconContainer(
                    size: 40,
                    url:
                        "https://64.media.tumblr.com/d2c3635d2168c2374a39c762e915c53d/31414909f6529090-da/s2048x3072/aeeee4aeba3d1f30ba5ef6674a284d7b75c9df1a.png"),
              ),
              left: 0,
            ),
            Positioned(
              child: Container(
                child: TestIconContainer(
                    size: 40,
                    url:
                        "https://64.media.tumblr.com/2febe678b5305c0cc1560d6b1406049a/e76b2b99fe8497c5-f1/s2048x3072/f620d308ae4f45c88d65216ba81db5996c8e50e4.jpg"),
              ),
              left: 20,
            ),
            Positioned(
              child: Container(
                child: TestIconContainer(
                    size: 40,
                    url:
                        "https://64.media.tumblr.com/3d6d9e2bcc94c6a605791747b656d29f/07e02d0da28d6185-62/s2048x3072/bd3b2946cfbf48b440d2a82f4640ad032831fdb1.jpg"),
              ),
              left: 40,
            ),
            Positioned(
              child: Container(
                child: TestIconContainer(
                    size: 40,
                    url:
                        "https://64.media.tumblr.com/c8619440062660035a74f58277bed522/db86a8d01606e6e0-8c/s2048x3072/c5066b423afb282b54972a82fb383739dbee6051.png"),
              ),
              left: 60,
            ),
          ],
        ),
      ),
    );
  }
}

class TestIconContainer extends StatelessWidget {
  const TestIconContainer({
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
      margin: EdgeInsets.symmetric(horizontal: _horizontalMargin, vertical: 2),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
          image: NetworkImage(this.url),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.green, width: 1.0),
      ),
    );
  }
}
