import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CommunityIconContainer extends StatelessWidget {
  const CommunityIconContainer({
    Key key,
    @required this.size,
    @required this.url,
  }) : super(key: key);
  final String url;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) => TestImageView(
              url: this.url,
            ),
          ),
        ),
      },
      child: Container(
        width: this.size,
        height: this.size,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
            image: NetworkImage(this.url),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}

class TestImageView extends StatelessWidget {
  final String url;

  const TestImageView({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            child: PhotoView(
              imageProvider: NetworkImage(this.url),
            ),
          ),
          Container(
            height: kToolbarHeight + MediaQuery.of(context).padding.top,
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).padding.left,
                right: MediaQuery.of(context).padding.right,
                top: MediaQuery.of(context).padding.top,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shape: CircleBorder(),
                        primary: Colors.white.withOpacity(0.2),
                        onPrimary: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
