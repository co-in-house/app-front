import 'package:Inhouse/component/appBar.dart';
import 'package:flutter/material.dart';

class LoungePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("========LoungePage build========");
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBarLounge(),
          SliverList(delegate: _LoungeDelegate(context))
        ],
      ),
    );
  }
}

class _LoungeDelegate extends SliverChildListDelegate {
  _LoungeDelegate(BuildContext context) : super(_Lounge.builda(context));
  BuildContext context;
}

class _Lounge {
  static List<Widget> builda(BuildContext context) {
    List<Widget> list = [];
    list.add(
      Container(
        child: Text('ラウンジ', style: TextStyle(fontSize: 32)),
      ),
    );
    list.add(
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Divider(color: Colors.black),
      ),
    );
    list.add(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Text('まだ何も実装していません。', style: TextStyle(fontSize: 20)),
      ),
    );

    list.add(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Text(
          '今後の実装に期待しましょう。検索中に見つけたお気に入りの宿泊先やアクティビティは、ハートのアイコンをタップすることでこちらに保存できます。（Airbnbより引用）',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );

    list.add(
      Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 0),
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          elevation: 2.0,
          shadowColor: Colors.black,
          color: Colors.green,
          child: InkWell(
            onTap: () {
              print("InkWell");
            },
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Room',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '1',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    list.add(
      Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 0),
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          elevation: 0.1,
          shadowColor: Colors.black,
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Room'),
                Text('2'),
              ],
            ),
          ),
        ),
      ),
    );

    list.add(
      Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 0),
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          elevation: 0.1,
          shadowColor: Colors.black,
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Room'),
                Text('3'),
              ],
            ),
          ),
        ),
      ),
    );
    return list;
  }
}



    // Container(
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Text(
    //           'Lounge Page',
    //           style: TextStyle(fontWeight: FontWeight.bold),
    //         ),
    //         Card(
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(15.0),
    //           ),
    //           elevation: 20.0,
    //           child: Container(
    //             margin: const EdgeInsets.all(10.0),
    //             width: MediaQuery.of(context).size.width * 0.50,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 Text('Room'),
    //                 Text('1'),
    //               ],
    //             ),
    //           ),
    //         ),
    //         Card(
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(15.0),
    //           ),
    //           elevation: 20.0,
    //           child: Container(
    //             margin: const EdgeInsets.all(10.0),
    //             width: MediaQuery.of(context).size.width * 0.50,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 Text('Room'),
    //                 Text('2'),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
