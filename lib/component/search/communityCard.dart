import 'package:Inhouse/component/search/tagTextListRow.dart';
import 'package:Inhouse/model/communityList.dart';
import 'package:Inhouse/view/communityDetialPage.dart';
import 'package:flutter/material.dart';

class CommunityCard extends StatelessWidget {
  final Community content;
  CommunityCard({this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2.0,
      child: InkWell(
        onTap: () {
          print("tapped! communityCard : " + content.toString());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CommunityDetailPage(
                community: content,
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          width: 300,
          // height: 100, // auto?
          alignment: Alignment.topCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Container(
              //   width: 100,
              //   height: 50,
              //   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     image: DecorationImage(
              //         // fit: BoxFit.fill,
              //         // image: AssetImage('images/' + content.),
              //         ),
              //   ),
              // ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                      child: Text(
                        content.communityName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 00.0, horizontal: 0.0),
                      child: Text(
                        content.content,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    Text(content.created),
                    Text(content.locationName),
                    Text(content.note),
                    content.profileImgUrl != null
                        ? Text(content.profileImgUrl)
                        : Text("urlなし"),
                    TagTextListRow(tagList: content.tags),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
