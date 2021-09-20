import 'package:Inhouse/model/colorModeState.dart';
import 'package:Inhouse/service/changeColorMode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class UserSettingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _SwitchColorModeContainer(),
        ],
      ),
    );
  }
}

class _SwitchColorModeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SwitchListTile(
        value: context.select((ColorModeState mode) => mode).isDarkMode,
        activeColor: Colors.green,
        activeTrackColor: Colors.green[100],
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey,
        title: Text('ダークモード'),
        // subtitle: Text('サブタイトル'),
        secondary: Icon(Icons.nightlight_outlined),
        onChanged: (bool value) => context.read<ChangeColorMode>().set(value),
      ),
    );
  }
}
