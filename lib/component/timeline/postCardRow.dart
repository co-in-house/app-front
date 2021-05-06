import 'package:Inhouse/component/timeline/postCard.dart';
import 'package:flutter/material.dart';

class PostCardRow extends StatelessWidget {
  final List row;
  PostCardRow({this.row});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(content: row[index]);
        },
        itemCount: row.length,
      ),
    );
  }
}
