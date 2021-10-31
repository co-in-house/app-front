import 'package:inhouse/util/theme.dart';
import 'package:inhouse/util/util.dart';
import 'package:flutter/material.dart';

class CommunityOnAirCutListRow extends StatelessWidget {
  const CommunityOnAirCutListRow({
    Key key,
    @required this.urlList,
  }) : super(key: key);
  final List<String> urlList;

  @override
  Widget build(BuildContext context) {
    List<Widget> iconList = [];
    if (urlList.isNotEmpty && urlList != null && urlList.length > 0) {
      for (int index = 0; index < urlList.length; index++) {
        iconList.add(OnAirCutContainer(url: urlList[index]));
      }
    } else {
      iconList.add(Container(height: 20)); // Cutがない場合は空行
    }
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green[50], inhouseThemeColor.backgroundColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: iconList,
        ),
      ),
    );
  }
}

class OnAirCutContainer extends StatelessWidget {
  const OnAirCutContainer({
    Key key,
    @required this.url,
  }) : super(key: key);
  final String url;
  final double count = 4;
  final double _oneSizeHorizontalMargin = 4;

  @override
  Widget build(BuildContext context) {
    final double _size = (MediaQuery.of(context).size.width -
            _oneSizeHorizontalMargin * (count * 2 + 1)) /
        (this.count + 0.5);
    return Container(
      width: _size,
      height: _size,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          horizontal: _oneSizeHorizontalMargin, vertical: 6),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
          image: NetworkImage(this.url),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: GradientBorder.uniform(
            width: 3.0,
            gradient: LinearGradient(
              colors: <Color>[
                Colors.yellow.shade600,
                Colors.orange,
                Colors.red
              ],
            )),
      ),
    );
  }
}
