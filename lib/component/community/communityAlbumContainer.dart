import 'package:Inhouse/component/community/communityInfoListDelegate.dart';
import 'package:Inhouse/mock/mock.dart';
import 'package:Inhouse/model/album.dart';
import 'package:Inhouse/util/util.dart';
import 'package:Inhouse/view/album/albumPage.dart';
import 'package:flutter/material.dart';

class CommunityAlbumListContainer extends StatelessWidget {
  const CommunityAlbumListContainer({@required this.communityName});
  final String communityName;

  @override
  build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text(
            "Album",
            style: TextStyle(fontSize: 24, color: Colors.grey),
          ),
        ),
        OneAlbumContainer(),
        OneAlbumContainerSample4(
          communityName: this.communityName,
          albumName: "test album",
        ),
      ],
    );
  }
}

class OneAlbumContainer extends CommunityBaseContainer {
  @override
  buildChild(BuildContext context) {
    final double _fullWidth =
        MediaQuery.of(context).size.width * Const.containerWidthPercentage;
    final double radius = 10;
    final BorderSide _borderSide = const BorderSide(
      color: Colors.white,
      width: 1,
    );
    return Column(
      children: [
        Container(
            child: Column(
          children: [
            Container(
              width: _fullWidth,
              height: _fullWidth / 2,
              decoration: BoxDecoration(
                border: Border(
                  bottom: _borderSide,
                ),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius),
                  ),
                  child: Image.network(
                    "https://64.media.tumblr.com/0317820d16f6aa4dfb218964540d5ca2/8e115be96e0d0f3e-ff/s1280x1920/d1605a5ea98ad3136f1e6ab435fd76757fc12609.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
            Row(
              children: [
                Container(
                  width: _fullWidth / 2,
                  height: _fullWidth / 2,
                  decoration: BoxDecoration(
                    border: Border(
                      top: _borderSide,
                      right: _borderSide,
                    ),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                      ),
                      child: Image.network(
                        "https://64.media.tumblr.com/e065a50ec0e02c5cfbc33273c4d0a502/e14429f11b30162b-88/s1280x1920/33f30ae6b12bf806d9791ead916e91933de193de.jpg",
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  width: _fullWidth / 2,
                  height: _fullWidth / 2,
                  decoration: BoxDecoration(
                    border: Border(
                      top: _borderSide,
                      left: _borderSide,
                    ),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(radius),
                      ),
                      child: Image.network(
                        "https://64.media.tumblr.com/f3549bc0507982b3b1753c2e3f3930f8/d55773cd29b07d7e-ec/s2048x3072/cf8046ca4f57c3f93895baa24d99e46efe5e4e23.jpg",
                        fit: BoxFit.cover,
                      )),
                ),
              ],
            ),
          ],
        )),
        Container(
          margin: EdgeInsets.zero,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Lineみたいなアルバム",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            "123",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

class OneAlbumContainerSample4 extends CommunityBaseContainer {
  OneAlbumContainerSample4({
    @required this.communityName,
    @required this.albumName,
  });
  final String communityName;
  final String albumName;

  @override
  buildChild(BuildContext context) {
    final double _fullWidth =
        MediaQuery.of(context).size.width * Const.containerWidthPercentage;
    final double radius = 10;
    final BorderSide _borderSide = const BorderSide(
      color: Colors.white,
      width: 1,
    );
    final List<String> _imgUrlList = Mock.imageUrlList;
    final OneAlbum _album = OneAlbum(
      communityName: this.communityName,
      albumName: "アルバム名",
      imgUrlList: _imgUrlList,
    );
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AlbumPage(
                  album: _album,
                ),
              ),
            );
          },
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: _fullWidth / 2,
                      height: _fullWidth / 2,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: _borderSide,
                          right: _borderSide,
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(radius),
                          ),
                          child: Image.network(
                            "https://64.media.tumblr.com/fbb7ad9cdb59b5966132f538e87ed22e/55aefaf90388dd79-8a/s1280x1920/58b115e57674cc46a0c26a24b8d0c1d1afb6b7e3.jpg",
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      width: _fullWidth / 2,
                      height: _fullWidth / 2,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: _borderSide,
                          left: _borderSide,
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(radius),
                          ),
                          child: Image.network(
                            "https://64.media.tumblr.com/f7a320f8004362aad8b02dd3321f4740/2617694217fcd36b-09/s400x600/69786b0ab17882cef8dd4812c189fbdc6bada0de.jpg",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: _fullWidth / 2,
                      height: _fullWidth / 2,
                      decoration: BoxDecoration(
                        border: Border(
                          top: _borderSide,
                          right: _borderSide,
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(radius),
                          ),
                          child: Image.network(
                            "https://64.media.tumblr.com/914ad3871d55317e4559c4e32443bfa9/tumblr_pdxxo66Wxh1qdjgwno1_500.jpg",
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      width: _fullWidth / 2,
                      height: _fullWidth / 2,
                      decoration: BoxDecoration(
                        border: Border(
                          top: _borderSide,
                          left: _borderSide,
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(radius),
                          ),
                          child: Image.network(
                            "https://64.media.tumblr.com/1a8efe720bdc0e8211d89fb08fe4980c/tumblr_pfewnok7ta1xsf642o1_400.jpg",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.zero,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Lineみたいなアルバム 4つ ver",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            "12345",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
