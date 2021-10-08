import 'package:Inhouse/model/eventList.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/rendering.dart';

// SliverAppBar for Event Detail Hero Image
class SliverAppBarEventDetailTmp extends StatelessWidget {
  SliverAppBarEventDetailTmp({
    @required this.eventInfo,
  }) : super();
  final OneCardOnEventList eventInfo;
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _SliverAppBarEventDetailTmp(
        toolBarHeight: kToolbarHeight,
        openHeight: MediaQuery.of(context).size.width,
        closedHeight: MediaQuery.of(context).padding.top,
        eventInfo: this.eventInfo,
      ),
      floating: false,
      pinned: true,
    );
  }
}

class _SliverAppBarEventDetailTmp extends SliverPersistentHeaderDelegate {
  double toolBarHeight;
  double closedHeight;
  double openHeight;
  OneCardOnEventList eventInfo;

  _SliverAppBarEventDetailTmp({
    this.toolBarHeight,
    this.closedHeight,
    this.openHeight,
    this.eventInfo,
  });

  @override
  Widget build(_, double shrinkOffset, bool overlapsContent) {
    var shrinkPercentage =
        min(1, shrinkOffset / (maxExtent - minExtent)).toDouble();

    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    // color: inhouseThemeColor.appBarTheme.backgroundColor, //背景色
                    color: Colors.green[50], //背景色
                  ),
                  Opacity(
                    opacity: 1 - shrinkPercentage,
                    child: SizedBox(
                      height: MediaQuery.of(_).size.width,
                      width: MediaQuery.of(_).size.width,
                      child: Hero(
                        tag: '_eventHeroNo' + this.eventInfo.id.toString(),
                        child: Image(
                          fit: BoxFit.cover,
                          alignment: FractionalOffset.topCenter,
                          image: NetworkImage(this.eventInfo.img),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    height: minExtent,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(_).padding.left,
                        right: MediaQuery.of(_).padding.right,
                        top: MediaQuery.of(_).padding.top,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(_);
                              },
                              child:
                                  Icon(Icons.arrow_back, color: Colors.black),
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shape: CircleBorder(),
                                primary: Colors.white,
                                onPrimary: Colors.green,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Opacity(
                              opacity: shrinkPercentage,
                              child: Text(
                                eventInfo.eventTitle,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                print("edit community!!!");
                              },
                              child: Icon(Icons.edit, color: Colors.black),
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shape: CircleBorder(),
                                primary: Colors.white,
                                onPrimary: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: max(1 - shrinkPercentage * 4, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 100),
                        Text(
                          this.eventInfo.eventTitle,
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'Subtitle',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => openHeight;

  @override
  double get minExtent => toolBarHeight + closedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class SliverAppBarEventDetail2 {
  Widget build(BuildContext context, ScrollController scrollController) {
    MediaQueryData screenInfo = MediaQuery.of(context);
    return PreferredSize(
      preferredSize: Size(screenInfo.size.width, kToolbarHeight),
      child: Container(
        height: kToolbarHeight + screenInfo.padding.top,
        color: Colors.transparent,
        padding: EdgeInsets.only(top: screenInfo.padding.top),
        child: _AppBarContentRow(scrollController: scrollController),
      ),
    );
  }
}

class _AppBarContentRow extends StatefulWidget {
  const _AppBarContentRow({Key key, this.scrollController}) : super(key: key);
  final ScrollController scrollController;

  @override
  State<StatefulWidget> createState() => _AppBarContentState();
}

class _AppBarContentState extends State<_AppBarContentRow> {
  bool isOpen;

  @override
  void initState() {
    setState(() {
      isOpen = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.scrollController.addListener(() {
      setState(() {
        isOpen = widget.scrollController.position.userScrollDirection ==
            ScrollDirection.forward;
      });
    });

    return Container(
      child: isOpen
          ? Row(
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
                      primary: Colors.green[400],
                      onPrimary: Colors.green,
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      print("pressed edit event");
                    },
                    child: Icon(Icons.edit, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shape: CircleBorder(),
                      primary: Colors.green[400],
                      onPrimary: Colors.green,
                    ),
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}
