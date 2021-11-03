import 'package:flutter/material.dart';
import 'package:inhouse/component/event/common/commOverviewContainer.dart';
import 'package:inhouse/model/community/CommunityOverview.dart';
import 'package:inhouse/model/community/JoinedCommunity.dart';
import 'package:inhouse/util/modal.dart';

class CommSelectContainer extends StatefulWidget {
  const CommSelectContainer(
      {Key key, this.joinedCommunityList, this.canTap = false, this.fixedComm})
      : super(key: key);
  final JoinedCommunityList joinedCommunityList;
  final CommunityOverview fixedComm;
  final bool canTap;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<CommSelectContainer> {
  CommunityOverview _currentComm;

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.fixedComm == null) {
        _currentComm = null;
      } else {
        _currentComm = widget.fixedComm;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () async {
          if (widget.canTap) {
            var result = await selectCommunityForEventModal(
              context: context,
              joinedCommunityList: widget.joinedCommunityList,
            );
            if (result != null) {
              setState(() {
                _currentComm = result;
              });
            }
          }
        },
        child: _currentComm == null
            ? Container(
                alignment: Alignment.centerLeft,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 30),
                    Text(
                      "主催コミュニティを追加する",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Icon(Icons.add, color: Colors.green),
                  ],
                ),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.all(Radius.circular(25)),
                //   color: Colors.grey[300],
                // ),
              )
            : CommOverviewContainer(commOverview: _currentComm),
      ),
    );
  }
}
