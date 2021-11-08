import 'package:flutter/material.dart';

class SuccessSB extends SnackBar {
  final String message;
  SuccessSB({
    this.message = "success",
  }) : super(
          content: Row(
            children: <Widget>[
              Icon(
                Icons.check,
                color: Colors.green,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 6.0,
          behavior: SnackBarBehavior.fixed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
        );
}

class FailedSB extends SnackBar {
  final String message;
  FailedSB({
    this.message = "Failed",
  }) : super(
          content: Row(
            children: <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 6.0,
          behavior: SnackBarBehavior.fixed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
        );
}
