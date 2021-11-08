import 'package:inhouse/util/theme.dart';
import 'package:flutter/material.dart';

class SliverAppBarEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      pinned: true,
      snap: false,
      expandedHeight: MediaQuery.of(context).size.width * 0.8, //正方形
      elevation: 0.0,

      flexibleSpace: Stack(
        children: [
          Positioned(
              // collapseするならこっち
              // child: FlexibleSpaceBar(
              //   collapseMode: CollapseMode.parallax,
              //   background: Container(
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //         colors: [
              //           const Color(0xFF31C941),
              //           const Color(0xFFFF9C61),
              //           inhouseThemeColor.backgroundColor,
              //         ],
              //         begin: Alignment.topCenter,
              //         end: Alignment.bottomCenter,
              //       ),
              //     ),
              //   ),
              // ),
              // collapseしないならこっち
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF31C941),
                      const Color(0xFFFF9C61),
                      inhouseThemeColor.backgroundColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
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
                  child: ListTile(
                    title: Text(
                      "Eventに参加しよう",
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Robot",
                        height: 1.2,
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
        ],
      ),

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48.0),
        child: Container(
          height: 48.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: inhouseThemeColor.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
