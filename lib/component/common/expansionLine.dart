import 'package:flutter/material.dart';

class ExpansionLineItem {
  ExpansionLineItem({
    @required this.headerValue,
    @required this.expandedWidget,
    this.isExpanded = false,
  });

  final String headerValue;
  final Widget expandedWidget;
  bool isExpanded;
}

class ExpansionLine extends StatefulWidget {
  const ExpansionLine({Key key, @required this.itemList}) : super(key: key);
  final List<ExpansionLineItem> itemList;

  @override
  State<ExpansionLine> createState() => _ExpansionLine();
}

class _ExpansionLine extends State<ExpansionLine> {
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
          widget.itemList[index].isExpanded = !isExpanded;
        });
      },
      children: widget.itemList.map<ExpansionPanel>((ExpansionLineItem item) {
        return ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text(
                item.headerValue,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            );
          },
          body: item.expandedWidget,
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
