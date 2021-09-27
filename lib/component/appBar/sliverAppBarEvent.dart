import 'package:Inhouse/util/theme.dart';
import 'package:Inhouse/util/util.dart';
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
      // expandedHeight: MediaQuery.of(context).size.width * 0.7, //正方形
      title: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.6,
        // child: ElevatedButton.icon(
        //   icon: Icon(Icons.search),
        //   label: Text(
        //     '活動を探す',
        //     style: TextStyle(
        //       color: Colors.black,
        //     ),
        //   ),
        //   style: ElevatedButton.styleFrom(
        //     animationDuration: Duration(seconds: 10),
        //     primary: Colors.white,
        //     onPrimary: Colors.green,
        //     elevation: 0,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //   ),
        //   onPressed: () {
        //     print("onPressed");
        //   },
        // ),
        child: Text("活動を探す"),
      ),

      flexibleSpace: Stack(
        children: [
          Positioned(
              // child: FlexibleSpaceBar(
              //   collapseMode: CollapseMode.parallax,
              //   background: Image(
              //     fit: BoxFit.cover,
              //     image: AssetImage("images/sport.jpg"),
              //   ),
              // ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: CustomColor.linearGradient(1),
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
                    "Check Your Events！",
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Arial",
                      height: 1.2,
                      // shadows: [
                      //   Shadow(
                      //       color: Colors.green,
                      //       offset: Offset.fromDirection(0.5, 4),
                      //       blurRadius: 1.0)
                      // ],
                      fontSize: 36,
                    ),
                  ),
                ),
              ],
            ),
            top: MediaQuery.of(context).size.width * 0.3,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
          ),
          // Positioned(
          //   height: 10,
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
