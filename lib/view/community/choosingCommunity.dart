import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:Inhouse/model/postList.dart';

class NextPage extends StatelessWidget {
  //final OneCardOnPostList content;
  //NextPage({this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
          width: 1000,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(0, 60, 0, 10),
                  child: Column(children: [
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage(
                            'images/ibm.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8.0),
                          onTap: () {},
                        ),
                      ),
                    ),
                    Container(
                      child: Text('IBM'),
                    )
                  ])),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  //
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 60, 0),
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image: AssetImage(
                                'images/ntt.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8.0),
                              onTap: () {},
                            ),
                          ),
                        ),
                        Container(
                          child: Text('ntt'),
                        )
                      ])),
                  //
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.symmetric(),
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image: AssetImage(
                                'images/logo.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8.0),
                              onTap: () {},
                            ),
                          ),
                        ),
                        Container(
                          child: Text('inhouse'),
                        )
                      ])),
                  //
                ],
              )
            ],
          ),
        ));
  }
}
