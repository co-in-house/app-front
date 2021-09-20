// SliverAppBar for Explore
import 'package:flutter/material.dart';

class SliverAppBarExplore extends StatelessWidget {
  SliverAppBarExplore({this.exploreTextController});
  final TextEditingController exploreTextController;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      pinned: true,
      snap: false,
      expandedHeight: MediaQuery.of(context).size.width * 0.8, //正方形
      title: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ElevatedButton.icon(
          icon: Icon(Icons.search),
          label: Text(
            'キーワード検索',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          style: ElevatedButton.styleFrom(
            animationDuration: Duration(seconds: 10),
            primary: Colors.white,
            onPrimary: Colors.green,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            print("onPressed");
          },
        ),
      ),

      flexibleSpace: Stack(
        children: [
          Positioned(
              child: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Image(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("images/wp.jpg"),
                ),
              ),
              top: 0,
              left: 0,
              right: 0,
              bottom: 0),
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    "自然を近くに感じる旅",
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Arial",
                      height: 1.2,
                      shadows: [
                        Shadow(
                            color: Colors.white,
                            offset: Offset.fromDirection(0, 0),
                            blurRadius: 0.0)
                      ],
                      fontSize: 46,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 1),
                  child: Text(
                    "inhouseが選ぶオススメ",
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Arial",
                      height: 1.2,
                      shadows: [
                        Shadow(
                            color: Colors.white,
                            offset: Offset.fromDirection(0, 0),
                            blurRadius: 0.0)
                      ],
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 0),
                  child: ElevatedButton(
                    child: Text(
                      "新しいコミュニティを作成する",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      animationDuration: Duration(seconds: 10),
                      primary: Colors.black,
                      onPrimary: Colors.green,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            top: MediaQuery.of(context).size.width * 0.3,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
          ),
        ],
      ),
    );
  }
}
