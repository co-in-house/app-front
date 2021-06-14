import 'package:Inhouse/component/appBar.dart';
import 'package:Inhouse/model/newCommunityInfo.dart';
import 'package:Inhouse/model/tagList.dart';
import 'package:Inhouse/util/util.dart';
import 'package:Inhouse/view/newCommunity/newCommunityContentPage.dart';
import 'package:flutter/material.dart';

class NewCommunityTagPage extends StatefulWidget {
  NewCommunityTagPage({Key key, this.newCommunityInfo}) : super(key: key);
  final NewCommunityInfo newCommunityInfo;

  @override
  _NewCommunityTagState createState() => _NewCommunityTagState();
}

class _NewCommunityTagState extends State<NewCommunityTagPage> {
  List<Widget> getList(TagList tagList) {
    return List<ElevatedButton>.generate(
      tagList.contentsList.length,
      (int index) => ElevatedButton(
        child: Text(tagList.contentsList[index].label),
        style: tagList.contentsList[index].flag
            ? ElevatedButton.styleFrom(
                elevation: 16,
              )
            : ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                elevation: 16,
              ),
        onPressed: () {
          setState(() {
            tagList.contentsList[index].flag =
                !tagList.contentsList[index].flag;
          });
          print(tagList.contentsList[index].label +
              " : " +
              tagList.contentsList[index].flag.toString());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarCommunity.tag(context),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width *
              Const.containerWidthPercentage,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: getList(widget.newCommunityInfo.tagList),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: Text("次へ"),
                    style: ElevatedButton.styleFrom(
                      elevation: 16,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewCommunityContentPage(
                              newCommunityInfo: widget.newCommunityInfo),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
