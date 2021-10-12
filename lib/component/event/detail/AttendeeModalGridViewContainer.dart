import 'package:Inhouse/component/icon/attendeeIconContainer.dart';
import 'package:flutter/material.dart';

class AttendeeModalGridViewContainer extends StatelessWidget {
  const AttendeeModalGridViewContainer({
    Key key,
    @required this.size,
    @required this.scrollController,
    this.crossAxisCount = 3,
  }) : super(key: key);
  final double size;
  final int crossAxisCount;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final double oneSize = size / crossAxisCount;
    return Flexible(
      child: ListView(
        controller: scrollController,
        children: [
          Row(
            children: [
              AttendeeIconContainer(
                size: oneSize,
                url:
                    'https://64.media.tumblr.com/1a8efe720bdc0e8211d89fb08fe4980c/tumblr_pfewnok7ta1xsf642o1_400.jpg',
              ),
              Container(width: oneSize, height: oneSize, color: Colors.red),
              Container(width: oneSize, height: oneSize, color: Colors.green),
            ],
          ),
          Row(
            children: [
              Container(width: oneSize, height: oneSize, color: Colors.pink),
              Container(width: oneSize, height: oneSize, color: Colors.yellow),
              Container(width: oneSize, height: oneSize, color: Colors.grey),
            ],
          ),
          Row(
            children: [
              Container(width: oneSize, height: oneSize, color: Colors.red),
              Container(width: oneSize, height: oneSize, color: Colors.green),
              Container(width: oneSize, height: oneSize, color: Colors.blue),
            ],
          ),
          Row(
            children: [
              Container(width: oneSize, height: oneSize, color: Colors.pink),
              Container(width: oneSize, height: oneSize, color: Colors.yellow),
              Container(width: oneSize, height: oneSize, color: Colors.grey),
            ],
          ),
          Row(
            children: [
              Container(width: oneSize, height: oneSize, color: Colors.red),
              Container(width: oneSize, height: oneSize, color: Colors.green),
              Container(width: oneSize, height: oneSize, color: Colors.blue),
            ],
          ),
          Row(
            children: [
              Container(width: oneSize, height: oneSize, color: Colors.pink),
              Container(width: oneSize, height: oneSize, color: Colors.yellow),
              Container(width: oneSize, height: oneSize, color: Colors.grey),
            ],
          ),
        ],
      ),
      // child: ListView.builder(
      //   // shrinkWrap: true,
      //   controller: scrollController,
      //   itemCount: 25,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Container(width: oneSize, height: oneSize, color: Colors.red);
      //   },
      // ),
    );
    // return Column(
    //   children: [
    //     Row(
    //       children: [
    //         Container(width: oneSize, height: oneSize, color: Colors.red),
    //         Container(width: oneSize, height: oneSize, color: Colors.green),
    //         Container(width: oneSize, height: oneSize, color: Colors.blue),
    //       ],
    //     ),
    //     Row(
    //       children: [
    //         Container(width: oneSize, height: oneSize, color: Colors.pink),
    //         Container(width: oneSize, height: oneSize, color: Colors.yellow),
    //         Container(width: oneSize, height: oneSize, color: Colors.grey),
    //       ],
    //     ),
    //     Row(
    //       children: [
    //         Container(width: oneSize, height: oneSize, color: Colors.red),
    //         Container(width: oneSize, height: oneSize, color: Colors.green),
    //         Container(width: oneSize, height: oneSize, color: Colors.blue),
    //       ],
    //     ),
    //     Row(
    //       children: [
    //         Container(width: oneSize, height: oneSize, color: Colors.pink),
    //         Container(width: oneSize, height: oneSize, color: Colors.yellow),
    //         Container(width: oneSize, height: oneSize, color: Colors.grey),
    //       ],
    //     ),
    //     Row(
    //       children: [
    //         Container(width: oneSize, height: oneSize, color: Colors.red),
    //         Container(width: oneSize, height: oneSize, color: Colors.green),
    //         Container(width: oneSize, height: oneSize, color: Colors.blue),
    //       ],
    //     ),
    //     Row(
    //       children: [
    //         Container(width: oneSize, height: oneSize, color: Colors.pink),
    //         Container(width: oneSize, height: oneSize, color: Colors.yellow),
    //         Container(width: oneSize, height: oneSize, color: Colors.grey),
    //       ],
    //     ),
    //   ],
    // );
  }
}
