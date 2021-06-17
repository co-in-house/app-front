import 'package:Inhouse/component/appBar.dart';
import 'package:flutter/material.dart';

class NewCommunitySampleCardPage extends StatefulWidget {
  NewCommunitySampleCardPage({Key key}) : super(key: key);

  @override
  _NewCommunitySampleCardState createState() => _NewCommunitySampleCardState();
}

class _NewCommunitySampleCardState extends State<NewCommunitySampleCardPage> {
  double _pageNo = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarCommunity.sample(context),
      body: Center(
        child: _buildCarousel(context),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: PageView(
            controller: PageController(viewportFraction: 0.8),
            onPageChanged: _onPageViewChange,
            children: [
              _nameCard(context),
              _tagCard(context),
              _locationCard(context),
            ],
          ),
        ),
        LinearProgressIndicator(
          value: this._pageNo == 0 ? 0.1 : this._pageNo / 2,
        ),
        this._pageNo == 2
            ? ElevatedButton(
                child: Text("次へ"),
                style: ElevatedButton.styleFrom(
                  elevation: 16,
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => NewCommunityLocationPage(
                  //         newCommunityInfo: newCommunityInfo),
                  //   ),
                  // );
                },
              )
            : ElevatedButton(
                child: Text("次へ"),
                style: ElevatedButton.styleFrom(
                  elevation: 16,
                ),
                onPressed: null),
      ],
    );
  }

  _onPageViewChange(int page) {
    print("Current Page: " + page.toString());
    setState(() {
      _pageNo = page.toDouble();
    });
  }

  Widget _nameCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2.0,
      child: Container(
          margin: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width * 0.80,
          alignment: Alignment.center,
          child: Text("コミュニティ名の入力")),
    );
  }
}

Widget _tagCard(BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 2.0,
    child: Container(
        margin: const EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width * 0.80,
        // height: 100,
        alignment: Alignment.center,
        // child: Image.asset('images/' + content.img, fit: BoxFit.fill),
        child: Text("タグの選択")),
  );
}

Widget _locationCard(BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 2.0,
    child: Container(
        margin: const EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width * 0.80,
        // height: 100,
        alignment: Alignment.center,
        // child: Image.asset('images/' + content.img, fit: BoxFit.fill),
        child: Text("活動場所の選択")),
  );
}
