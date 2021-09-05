import 'package:Inhouse/component/lounge/roomGrid.dart';
import 'package:flutter/material.dart';

class Item {
  Item({
    @required this.expandedValue,
    @required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class ExpansionLine extends StatefulWidget {
  const ExpansionLine({Key key}) : super(key: key);

  @override
  State<ExpansionLine> createState() => _ExpansionLine();
}

class _ExpansionLine extends State<ExpansionLine> {
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      elevation: 2,
      animationDuration: Duration(milliseconds: 300),
      expandedHeaderPadding: EdgeInsets.symmetric(horizontal: 00, vertical: 0),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          // backgroundColor: Colors.transparent,
          // canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              // color: Colors.red,
              alignment: Alignment.centerLeft,
              child: Text(
                '@' + "コミュニティ名",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            );
          },
          body: RoomGrid(),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
