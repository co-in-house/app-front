import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 2.0,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              width: 300,
              height: 100,
              alignment: Alignment.topCenter,
              child: Image.asset('images/logo.png', fit: BoxFit.fill),
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 2.0,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              width: 300,
              height: 100,
              alignment: Alignment.topCenter,
              child: Image.asset('images/ntt.png', fit: BoxFit.fill),
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 2.0,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              width: 300,
              height: 100,
              alignment: Alignment.topCenter,
              child: Image.asset('images/ibm.png', fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}
