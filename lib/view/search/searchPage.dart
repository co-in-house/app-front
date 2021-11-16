import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inhouse/view/search/searchHistoryPage.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("========SearchPage build========");
    return Center(
      child: ElevatedButton.icon(
        icon: Icon(
          Icons.search,
        ),
        label: Text('コミュニティを検索しよう'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchHistoryPage(),
              // fullscreenDialog: true, // 下からpop
            ),
            // アニメーションなしver
            // PageRouteBuilder(
            //   pageBuilder: (context, animation1, animation2) =>
            //       SearchHistoryPage(),
            //   transitionDuration: Duration.zero,
            // ),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(25.0),
          ),
          primary: Colors.white,
          onPrimary: Colors.green,
          shadowColor: Colors.green,
        ),
      ),
    );
    // return GestureDetector(
    //   onTap: () {
    //     debugPrint("hogehgoe tap!");
    //     FocusScope.of(context).unfocus();
    //   },
    //   child: Container(
    //     alignment: Alignment.center,
    //     color: Colors.transparent,
    //     padding: EdgeInsets.symmetric(
    //         horizontal: MediaQuery.of(context).size.width * 0.1),
    //     child: Material(
    //       elevation: 10.0,
    //       borderRadius: BorderRadius.all(Radius.circular(25)),
    //       child: TextField(
    //         cursorColor: Colors.green,
    //         style: const TextStyle(
    //           color: Colors.black,
    //         ),
    //         maxLines: 1,
    //         autofocus: true,
    //         autocorrect: false,
    //         enabled: true,
    //         obscureText: false,
    //         textAlign: TextAlign.left,
    //         decoration: const InputDecoration(
    //           errorStyle: TextStyle(color: Colors.red),
    //           errorMaxLines: 1,
    //           border: InputBorder.none,
    //           counterText: '',
    //           hintText: 'コミュニティを検索しよう',
    //           hintStyle: TextStyle(
    //             height: 0.4,
    //             color: Colors.green,
    //           ),
    //           prefixIcon: Icon(
    //             Icons.search,
    //             color: Colors.green,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
