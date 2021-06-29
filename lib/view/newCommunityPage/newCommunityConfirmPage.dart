import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/main.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:Inhouse/service/api/postNewCommunityService.dart';
import 'package:Inhouse/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewCommunityConfirmPage extends StatelessWidget {
  NewCommunityConfirmPage({Key key, this.newCommunityInfo}) : super(key: key);
  final NewCommunityInfo newCommunityInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Transform.translate(
              offset: Offset(0, -20),
              child: AppBar(
                title: Text("コミュニティを作成"),
                backgroundColor: Colors.transparent,
                shadowColor: Color.fromRGBO(0, 0, 0, 0.4),
                elevation: 0.1,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
            ),
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            stretch: true,
            floating: true,
            pinned: true,
            snap: true,
            expandedHeight: MediaQuery.of(context).size.width, //正方形
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              //  Container(
              background: Image.asset(
                newCommunityInfo.iconImg.path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 200.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[200 * ((index + 1) % 9)],
                  child: Text(
                    'list item $index',
                    style: TextStyle(fontSize: 30),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
    
    
//     Scaffold(
//       appBar: CustomAppBar.newCommunity(context),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(newCommunityInfo.toString()),
//             context.select((NewCommunityInfo response) => response).isLoading
//                 ? LinearProgressIndicator()
//                 : ElevatedButton(
//                     child: Text("submit"),
//                     style: ElevatedButton.styleFrom(elevation: 16),
//                     onPressed: () async {
//                       print("submit");
//                       await context
//                           .read<PostNewCommunityService>()
//                           .call(newCommunityInfo);
//                       Navigator.pushAndRemoveUntil(
//                           context,
//                           new MaterialPageRoute(
//                               builder: (context) => new MyApp()),
//                           (_) => false);
//                     },
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }
