import 'package:flutter/material.dart';
//import 'package:Inhouse/model/postList.dart';

class NextPage extends StatelessWidget {
  //final OneCardOnPostList content;
  //NextPage({this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('コミュニティを選択'),
          backgroundColor: Colors.lightGreen[200],
          elevation: 0.0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.clear))
          ],
        ),
        body: Container(
            color: Colors.lightGreen[200],
            child: Center(
                child: Wrap(direction: Axis.horizontal, children: <Widget>[
              //Container(
              //child: Column(children: [
              Container(
                  child: Column(children: [
                Container(
                    child: (RaisedButton(
                  color: Colors.white,
                  shape: CircleBorder(),
                  elevation: 0.0,
                  onPressed: () {},
                  child: ClipOval(
                      child: Image(
                    width: 60,
                    image: AssetImage('images/ibm.png'),
                    //image: AssetImage('images/' + content.img),
                    fit: BoxFit.contain,
                  )),
                ))),
                Container(
                  child: Text('IBM'),
                )
              ])),
              Container(
                  child: Column(children: [
                RaisedButton(
                  color: Colors.white,
                  shape: CircleBorder(),
                  elevation: 0.0,
                  onPressed: () {},
                  child: ClipOval(
                      child: Image(
                    width: 70,
                    image: AssetImage('images/ntt.png'),
                    //image: AssetImage('images/' + content.img),
                    fit: BoxFit.contain,
                  )),
                ),
                Container(
                  child: Text('ntt'),
                )
              ])),
              Container(
                  child: Column(children: [
                RaisedButton(
                  color: Colors.white,
                  onPressed: () {},
                  shape: CircleBorder(),
                  elevation: 0.0,
                  child: ClipOval(
                      child: Image(
                    width: 70,
                    image: AssetImage('images/logo.png'),
                    //image: AssetImage('images/' + content.img),
                    fit: BoxFit.contain,
                  )),
                ),
                Container(
                  child: Text('inhouse'),
                )
              ])),
              //])
            ]))));
  }
}
