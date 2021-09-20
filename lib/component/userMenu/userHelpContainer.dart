import 'package:flutter/material.dart';

class UserHelpContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _FQAContainer(),
          _ContactContainer(),
        ],
      ),
    );
  }
}

class _FQAContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text("FQA"),
        // subtitle: Text("subTitle"),
        leading: Icon(Icons.question_answer),
        onTap: () => {},
        onLongPress: () => {},
        // trailing: Icon(Icons.more_vert),
        // tileColor: Colors.red,
      ),
    );
  }
}

class _ContactContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text("お問い合わせ"),
        // subtitle: Text("subTitle"),
        leading: Icon(Icons.contact_mail),
        onTap: () => {},
        onLongPress: () => {},
        // trailing: Icon(Icons.more_vert),
        // tileColor: Colors.red,
      ),
    );
  }
}
