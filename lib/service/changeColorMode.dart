import 'package:Inhouse/model/colorModeState.dart';
import 'package:state_notifier/state_notifier.dart';

class ChangeColorMode extends StateNotifier<ColorModeState> {
  ChangeColorMode() : super(ColorModeState());

  void set(bool isDarkMode) {
    print("Color Mode 変更, isDarkMode : " + isDarkMode.toString());
    state = ColorModeState(isDarkMode: isDarkMode);
  }
}
