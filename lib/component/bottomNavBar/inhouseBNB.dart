import 'package:flutter/material.dart';
import 'package:inhouse/service/changePage.dart';
import 'package:provider/provider.dart';

class InhouseBNB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<InhouseBNB> {
  var _navIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: ThemeData.light().unselectedWidgetColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      iconSize: 32,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.chair_outlined),
          activeIcon: Icon(Icons.chair),
          label: 'ラウンジ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          activeIcon: Icon(Icons.search),
          label: '検索',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_outlined),
          activeIcon: Icon(Icons.event),
          label: 'イベント',
        ),
        BottomNavigationBarItem(
          icon: _BottomUserIcon(
            size: 30,
            url:
                'https://66.media.tumblr.com/c063f0b98040e8ec4b07547263b8aa15/tumblr_inline_ppignaTjX21s9on4d_540.jpg',
          ),
          label: 'プロフィール',
        ),
      ],
      onTap: (int index) {
        context.read<ChangePage>().set(index);
        setState(
          () {
            _navIndex = index;
          },
        );
      },
      currentIndex: _navIndex,
    );
  }
}

class _BottomUserIcon extends StatelessWidget {
  const _BottomUserIcon({Key key, @required this.size, @required this.url})
      : super(key: key);
  final double size;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        backgroundImage: NetworkImage(this.url),
        backgroundColor: Colors.green,
        radius: size * 0.6,
      ),
    );
  }
}
