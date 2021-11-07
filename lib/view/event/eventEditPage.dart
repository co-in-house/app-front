import 'package:inhouse/component/appBar/inhouseAppBar.dart';
import 'package:flutter/material.dart';
import 'package:inhouse/component/event/edit/eventEditDelegate.dart';
import 'package:inhouse/model/community/CommunityOverview.dart';
import 'package:inhouse/model/community/JoinedCommunity.dart';
import 'package:inhouse/model/event/eventList.dart';
import 'package:inhouse/service/event/selectTimeService.dart';
import 'package:inhouse/view/event/eventConfirmPage.dart';
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
  TextEditingController _selectedCommIdCtrl = TextEditingController();
  TextEditingController _selectedCommNameCtrl = TextEditingController();
  TextEditingController _selectedCommImgUrlCtrl = TextEditingController();
  TextEditingController _selectedCommErrorCtrl = TextEditingController();
  TextEditingController _assetImgPathCtrl = TextEditingController();
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
                _selectedCommIdCtrl,
                _selectedCommNameCtrl,
                _selectedCommImgUrlCtrl,
                _selectedCommErrorCtrl,
                _assetImgPathCtrl,
                _longTextKey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _confirmFB() {
    SelectDateTimeState _selectDatetime = context
        .select((SelectDateTimeState selectedDateTime) => selectedDateTime);
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
              CommunityOverview _selectedComm = CommunityOverview(
                communityId: num.parse(_selectedCommIdCtrl.text),
                communityName: _selectedCommNameCtrl.text,
                iconImg: _selectedCommImgUrlCtrl.text,
              );

              String _start = _selectDatetime.startDateTimeStr;
              String _end = _selectDatetime.endDateTimeStr;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventConfirmPage(
                    assetImgPath: _assetImgPathCtrl.text,
                    networkImgUrl: null,
                    title: _titleCtrl.text,
                    start: _start,
                    end: _end,
                    location: _locationCtrl.text,
                    selectedComm: _selectedComm,
                    description: _descriptionCtrl.text,
                  ),
                ),
              );
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
