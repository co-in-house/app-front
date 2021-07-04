import 'package:flutter/material.dart';

abstract class NewCommunityBaseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.grey, width: 0.5),
        ),
        elevation: 0.0,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width * 0.80,
          alignment: Alignment.center,
          child: buildChild(context),
        ),
      ),
    );
  }

  Widget buildChild(BuildContext context);
}
