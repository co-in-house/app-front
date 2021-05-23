import 'package:Inhouse/model/eventList.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final OneCardOnEventList content;
  EventCard({this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2.0,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        width: 300,
        height: 100,
        alignment: Alignment.topCenter,
        // child: Image.asset('images/' + content.img, fit: BoxFit.fill),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  // fit: BoxFit.fill,
                  image: AssetImage('images/' + content.img),
                ),
              ),
            ),
            Text('action buttons line'),
          ],
        ),
        // child: Container(
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     image: DecorationImage(
        //       // fit: BoxFit.fill,
        //       image: AssetImage('images/' + content.img),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
