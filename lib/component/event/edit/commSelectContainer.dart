import 'package:flutter/material.dart';
import 'package:inhouse/component/event/common/commOverviewContainer.dart';
import 'package:inhouse/model/community/CommunityOverview.dart';
import 'package:inhouse/model/community/JoinedCommunity.dart';
import 'package:inhouse/util/modal.dart';

class CommSelectContainer extends StatefulWidget {
  const CommSelectContainer({
    Key key,
    this.joinedCommunityList,
    this.canTap = false,
    this.fixedComm,
    this.selectedCommIdCtrl,
    this.selectedCommNameCtrl,
    this.selectedCommImgUrlCtrl,
    this.selectedCommErrorCtrl,
  }) : super(key: key);
  final JoinedCommunityList joinedCommunityList;
  final CommunityOverview fixedComm;
  final TextEditingController selectedCommIdCtrl;
  final TextEditingController selectedCommNameCtrl;
  final TextEditingController selectedCommImgUrlCtrl;
  final TextEditingController selectedCommErrorCtrl;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: InkWell(
            onTap: () async {
              if (widget.canTap) {
                var result = await selectCommunityForEventModal(
                  context: context,
                  joinedCommunityList: widget.joinedCommunityList,
                );
                if (result != null) {
                  widget.selectedCommIdCtrl.text =
                      result.communityId.toString();
                  widget.selectedCommNameCtrl.text = result.communityName;
                  widget.selectedCommImgUrlCtrl.text = result.iconImg;
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
                          "???????????????????????????????????????",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(Icons.add, color: Colors.green),
                      ],
                    ),
                  )
                : CommOverviewContainer(commOverview: _currentComm),
          ),
        ),
        AnimatedContainer(
          height: widget.selectedCommErrorCtrl != null &&
                  widget.selectedCommErrorCtrl.text != "" &&
                  widget.selectedCommNameCtrl.text.trim().length == 0
              ? 20.0
              : 0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          child: _errorContainer(),
        ),
      ],
    );
  }

  Widget _errorContainer() {
    if (widget.selectedCommErrorCtrl != null &&
        widget.selectedCommErrorCtrl.text != null &&
        widget.selectedCommNameCtrl.text.trim().length == 0) {
      return Container(
        height: 20,
        child: Text(
          widget.selectedCommErrorCtrl.text,
          style: TextStyle(color: Colors.red),
        ),
      );
    } else {
      return Container();
    }
  }
}
