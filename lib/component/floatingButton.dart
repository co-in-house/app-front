//import 'package:Inhouse/view/community/choosingCommunity.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NextPage()),
        );*/

        print("pressed floatingActionButton");
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              //Column(
              actions: <Widget>[
                ElevatedButton(
                  child: Text("CANCEL"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 16,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Column(children: [
                      //button
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
                      //this
                    ]),
                  ],
                ),
              ),
              backgroundColor: Colors.lightGreen[200],
            );
          },
        );
      },
    );
  }
}
