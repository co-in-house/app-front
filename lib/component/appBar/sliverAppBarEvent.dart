import 'package:Inhouse/util/theme.dart';
import 'package:flutter/material.dart';

class SliverAppBarEvent extends StatelessWidget {
  SliverAppBarEvent({this.searchTextController});
  final TextEditingController searchTextController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: false,
      pinned: true,
      snap: false,
      expandedHeight: MediaQuery.of(context).size.width * 0.8, //正方形
      elevation: 0.0,
      bottom: PreferredSize(
        // bottomのみ
        preferredSize: Size
            .zero, // .fromHeight(MediaQuery.of(context).padding.top), //const Size.fromHeight(kToolbarHeight),
        child: Container(
          width: double.infinity,
          color: inhouseThemeColor.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  alignment: Alignment.center,
                  child: Text("すべて"),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.green[400],
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  alignment: Alignment.center,
                  child: Text("参加コミュニティ内"),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottom: TabBar(
      //   tabs: _tabs.map((String name) => Tab(text: name)).toList(),
      //   controller: _tabController,
      // ),
      // (
      //   tabs: _tabs.map((String name) => Tab(text: name)).toList(),
      // ),
      // title: Container(
      //   alignment: Alignment.center,
      //   width: MediaQuery.of(context).size.width * 0.6,
      //   child: ElevatedButton.icon(
      //     icon: Icon(Icons.search),
      //     label: Text(
      //       '活動を探す',
      //       style: TextStyle(
      //         color: Colors.black,
      //       ),
      //     ),
      //     style: ElevatedButton.styleFrom(
      //       animationDuration: Duration(seconds: 10),
      //       primary: Colors.white,
      //       onPrimary: Colors.green,
      //       elevation: 0,
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(15),
      //       ),
      //     ),
      //     onPressed: () {
      //       print("onPressed");
      //     },
      //   ),
      //   // child: Text("活動を探す"),
      // ),

      flexibleSpace: Stack(
        children: [
          Positioned(
              child: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                // background: Image(
                //   fit: BoxFit.cover,
                //   image: AssetImage("images/sport.jpg"),
                // ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        // const Color(0xFFF7797D),
                        // const Color(0xFFC471ED),
                        // const Color(0xFF12C2E9),
                        // const Color(0xFF8e9eab),
                        // const Color(0xFFeef2f3),
                        const Color(0xFF005AA7),
                        const Color(0xFFFFFDE4),
                        // const Color(0xFFc471ed),
                        inhouseThemeColor.backgroundColor,
                      ],
                      // begin: Alignment.topLeft,
                      // end: Alignment.bottomRight,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              // child: Container(
              //   decoration: BoxDecoration(
              //     gradient: CustomColor.linearGradient(1),
              //   ),
              // ),
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
                  child: ListTile(
                    title: Text(
                      "Eventに参加しよう",
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Robot",
                        height: 1.2,
                        // shadows: [
                        //   Shadow(
                        //       color: Colors.white,
                        //       offset: Offset.fromDirection(0.5, 4),
                        //       blurRadius: 1.0)
                        // ],
                        fontSize: 36,
                      ),
                    ),
                    subtitle: Text(
                      "更なる高み、目指しちゃう？",
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Robot",
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            top: MediaQuery.of(context).size.width * 0.45,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
          ),
          // Positioned(
          //   height: 50,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(100),
          //           topRight: Radius.circular(100)),
          //       color: inhouseThemeColor.backgroundColor,
          //     ),
          //   ),
          //   right: 0,
          //   left: 0,
          //   bottom: 0,
          // ),
        ],
      ),
    );
  }
}
