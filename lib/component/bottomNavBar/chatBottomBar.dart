import 'package:inhouse/model/lounge/roomState.dart';
import 'package:inhouse/util/theme.dart';
import 'package:inhouse/util/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(color: inhouseThemeColor.backgroundColor),
      child: Container(
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          top: 10,
          bottom: 25,
        ),
        // decoration: BoxDecoration(color: Colors.red),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      gradient: CustomColor.linearGradient(context
                          .select((RoomState roomState) => roomState)
                          .index),
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: EdgeInsets.only(
                      left: 4,
                      right: 16,
                      top: 4,
                      bottom: 4,
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.input),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(hintText: "おしゃべりしてみる"),
                            style: TextStyle(height: 1.2),
                          ),
                        )
                      ],
                    )),
              ),
              Icon(Icons.send, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
