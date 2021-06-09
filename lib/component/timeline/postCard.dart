import 'package:Inhouse/model/postList.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final OneCardOnPostList content;
  PostCard({this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        width: 300,
        // height: 100, // auto?
        alignment: Alignment.topCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 100,
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  // fit: BoxFit.fill,
                  image: AssetImage('images/' + content.img),
                ),
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                      child: Text(
                        'Inhouse',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    //ここからID
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.5),
                      child: Text(
                        '@Inhouse',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ]),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0),
                    child: Text(
                      'めちゃ長い文章を書きたいのだけれど、思いつかないからその旨を記載してみるめちゃめちゃ長い文章を書きたいのだけれど、思いつかないからその旨を記載してみるめちゃめちゃ長い文章を書きたいのだけれど、思いつかないからその旨を記載してみる',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.pink,
                              size: 20.0,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.archive,
                              color: Colors.green,
                              size: 20.0,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.comment,
                              color: Colors.blue,
                              size: 20.0,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.share,
                              color: Colors.black,
                              size: 20.0,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
