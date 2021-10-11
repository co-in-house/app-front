import 'package:Inhouse/util/modal.dart';
import 'package:flutter/material.dart';

class EventJoinButtonContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EventJoinButtonContainer();
}

class _EventJoinButtonContainer extends State<EventJoinButtonContainer> {
  final double _height = 45;
  final EdgeInsets _padding = const EdgeInsets.symmetric(horizontal: 12);
  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(10.0));
  bool _isJoin = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      _isJoin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (!_isJoin) {
          bool _isJoinConfirm = await eventJoinConfirmModal(context);
          if (_isJoinConfirm != null && _isJoinConfirm) {
            setState(() {
              _isJoin = true;
            });
          }
        } else {
          bool _isCancelConfirm = await eventCancelConfirmModal(context);
          if (_isCancelConfirm != null && _isCancelConfirm) {
            setState(() {
              _isJoin = false;
            });
          }
        }
      },
      child: AnimatedContainer(
        duration: _isJoin
            ? const Duration(milliseconds: 500)
            : const Duration(milliseconds: 0),
        height: _height,
        width: _isJoin ? 45 : 45 * 1.8,
        padding: _padding,
        decoration: BoxDecoration(
          color: _isJoin ? Colors.grey : Colors.green[400],
          borderRadius: _borderRadius,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 0),
          reverseDuration: const Duration(milliseconds: 0),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: _isJoin
              ? Icon(
                  Icons.event_available,
                  color: Colors.black,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.event,
                      color: Colors.white,
                    ),
                    Text(
                      "Join",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
