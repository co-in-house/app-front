import 'package:flutter/material.dart';
import 'package:inhouse/model/community/CommunityOverview.dart';

class CommOverviewContainer extends StatelessWidget {
  const CommOverviewContainer(
      {Key key, this.commOverview, this.doPop = false, this.doPush = false})
      : super(key: key);
  final CommunityOverview commOverview;
  final bool doPop;
  final bool doPush;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: doPop || doPush
            ? InkWell(
                splashColor: Colors.green,
                onTap: () => {
                  if (doPop)
                    {
                      Navigator.pop(context, this.commOverview),
                    },
                  if (doPush)
                    {
                      // コミュニティ詳細に飛ぶなどpushアクション
                    }
                },
                child: _child(),
              )
            : _child(),
      ),
    );
  }

  Widget _child() {
    return ListTile(
      leading: _Icon(url: this.commOverview.iconImg),
      title: Text(this.commOverview.communityName),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon({Key key, @required this.url}) : super(key: key);
  final double size = 50;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
          image: NetworkImage(this.url),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }
}
