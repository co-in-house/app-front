import 'package:inhouse/component/appBar/inhouseAppBar.dart';
import 'package:flutter/material.dart';
import 'package:inhouse/component/event/edit/eventEditDelegate.dart';
import 'package:inhouse/model/community/JoinedCommunity.dart';
import 'package:inhouse/model/event/eventList.dart';
import 'package:inhouse/service/event/selectTimeService.dart';
import 'package:provider/provider.dart';

class EventEditPage extends StatefulWidget {
  EventEditPage({Key key, this.content, this.joinedCommunityList})
      : super(key: key);
  final OneEvent content;
  final JoinedCommunityList joinedCommunityList;
  @override
  _NewEventCreateState createState() => _NewEventCreateState();
}

class _NewEventCreateState extends State<EventEditPage> {
  TextEditingController _titleCtrl = TextEditingController();
  TextEditingController _titleErrorCtrl = TextEditingController();
  TextEditingController _locationCtrl = TextEditingController();
  TextEditingController _locationErrorCtrl = TextEditingController();
  TextEditingController _descriptionCtrl = TextEditingController();
  TextEditingController _descriptionErrorCtrl = TextEditingController();
  TextEditingController _selectedCommNameCtrl = TextEditingController();
  TextEditingController _selectedCommErrorCtrl = TextEditingController();
  final UniqueKey _longTextKey = UniqueKey();
  @override
  void initState() {
    super.initState();
    context.read<SelectDateTimeService>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InhouseAppBar.build(context, []),
      floatingActionButton: _confirmFB(),
      extendBodyBehindAppBar: true,
      body: Container(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            SliverList(
              delegate: EventEditDelegate(
                context,
                widget.content,
                widget.joinedCommunityList,
                _titleCtrl,
                _titleErrorCtrl,
                _locationCtrl,
                _locationErrorCtrl,
                _descriptionCtrl,
                _descriptionErrorCtrl,
                _selectedCommNameCtrl,
                _selectedCommErrorCtrl,
                _longTextKey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _confirmFB() {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
      child: FloatingActionButton.extended(
        label: Text('確認'),
        onPressed: () {
          bool _isValid = true;
          setState(() {
            if (_titleCtrl.text.trim().length < 1) {
              _titleErrorCtrl.text = "必須項目です.";
              _isValid = false;
            }
            if (_locationCtrl.text.trim().length < 1) {
              _locationErrorCtrl.text = "必須項目です.";
              _isValid = false;
            }
            if (_selectedCommNameCtrl.text.trim().length < 1) {
              _selectedCommErrorCtrl.text = "必須項目です.";
              _isValid = false;
            }
            if (!context.read<SelectDateTimeService>().isValid()) {
              _isValid = false;
            }
            if (_isValid) {
              debugPrint("OK!");
            } else {
              debugPrint("NG!");
            }
          });
        },
        icon: Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
