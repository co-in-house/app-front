import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UserProfileSubscribedCommunityRow extends StatelessWidget {
  const UserProfileSubscribedCommunityRow(
      {Key key, @required this.url, @required this.communityName})
      : super(key: key);
  final String url;
  final String communityName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          color: Colors.white,
          child: ListTile(
            // leading: CircleAvatar(
            //   backgroundImage: NetworkImage(this.url),
            //   backgroundColor: Colors.green,
            // ),
            leading: _LeadingIcon(url: this.url),

            // CircleAvatar(
            //   backgroundColor: Colors.indigoAccent,
            //   child: Text('ぺ！'),
            //   foregroundColor: Colors.white,
            // ),
            title: Text(this.communityName),
            subtitle: Text('追加情報なんか出すか？加入した日付とか？'),
          ),
        ),
        // actions: <Widget>[
        //   IconSlideAction(
        //     caption: 'Archive',
        //     color: Colors.blue,
        //     icon: Icons.archive,
        //     onTap: () => _showSnackBar('Archive'),
        //   ),
        //   IconSlideAction(
        //     caption: 'Share',
        //     color: Colors.indigo,
        //     icon: Icons.share,
        //     onTap: () => _showSnackBar('Share'),
        //   ),
        // ],
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'More',
            color: Colors.black45,
            icon: Icons.more_horiz,
            onTap: () => _showSnackBar('More'),
          ),
          IconSlideAction(
            caption: '退会',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  // title: Text('確認'),
                  content: Text('本当に退会しますか？'),
                  actions: <Widget>[
                    ElevatedButton(
                      child: Text('Cancel'),
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        animationDuration: Duration(seconds: 10),
                        primary: Colors.green,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(0),
                    ),
                    ElevatedButton(
                      child: Text('OK'),
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        animationDuration: Duration(seconds: 10),
                        primary: Colors.white,
                        onPrimary: Colors.green,
                      ),
                      onPressed: () => Navigator.of(context).pop(1),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _showSnackBar(String te) {
    print(te);
  }
}

class _LeadingIcon extends StatelessWidget {
  const _LeadingIcon({Key key, @required this.url}) : super(key: key);
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
