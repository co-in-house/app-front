import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miniplayer/miniplayer.dart';

class Const {
  // rooting No
  static final int routingNoHome = 0;
  static final int routingNoExplore = 1;
  static final int routingNoLounge = 2;
  static final int routingNoEvent = 3;
  static final int routingNoMessage = 4;
  static final int routingNoCut = 5;

  // size
  static final double containerWidthPercentage = 0.9;
  static final double containerHightPercentage = 0.9;

  static final double refreshIndicatorDisplacement = 100.0;

  static final double miniPlayerMinimumSize = 60;

  // size
  static final double footerHeight = 75;

  // borderRadius
  static final double borderRadius = 16.0;
  // label
  static final String assetDirName = 'images';

  // global controller
  static final MiniplayerController miniplayerController =
      MiniplayerController();
  static final ValueNotifier<double> playerExpandProgress =
      ValueNotifier(Const.miniPlayerMinimumSize);
}

class OsAccess {
  static final picker = ImagePicker();
  static Future<PickedFile> getImageFromCamera() async {
    try {
      final pickedFile = await picker.getImage(source: ImageSource.camera);
      return pickedFile;
    } on PlatformException catch (err) {
      print(err);
    } on Exception catch (err) {
      print(err);
    }
    return null;
  }

  static Future<PickedFile> getImageFromGallery() async {
    PickedFile pickedFile;
    try {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
      return pickedFile;
    } on PlatformException catch (err) {
      print(err);
    } on Exception catch (err) {
      print(err);
    }
    return null;
  }
}

class DatetimeUtil {
  static String getCurrentDateString() {
    DateTime now = DateTime.now();
    String day = now.day.toString();
    String month = now.month.toString();
    String year = now.year.toString();
    String hour = now.hour.toString();
    String minute = now.minute.toString();
    return year + "/" + month + "/" + day + " " + hour + ":" + minute;
  }
}

class Check {
  static bool isAssetPath(String path) {
    if (path != null &&
        path.trim().length > Const.assetDirName.length &&
        path.trim().substring(0, Const.assetDirName.length) ==
            Const.assetDirName) {
      return true;
    }
    return false;
  }

  static bool isUrlPath(String path) {
    String prt = 'http';
    if (path != null &&
        path.trim().length > prt.length &&
        path.trim().substring(0, prt.length) == prt) {
      return true;
    }
    return false;
  }
}

class CustomColor {
  List<Color> _gradientColor(int index) {
    switch (index.toString()) {
      case '1':
        return [
          const Color(0xFFF7797D),
          const Color(0xFFC471ED),
          const Color(0xFF12C2E9),
        ];
        break;
      case '2':
        return [
          const Color(0xFF5D26C1),
          const Color(0xFFA17FE0),
          const Color(0xFF59C173),
        ];
        break;
      case '3':
        return [
          const Color(0xFF00F260),
          const Color(0xFF0575E6),
        ];
        break;
      case '4':
        return [
          const Color(0xFFEC2F4D),
          const Color(0xFF009FFF),
        ];
        break;
      case '5':
        return [
          const Color(0xFF5D26C1),
          const Color(0xFF8A2387),
          const Color(0xFFE94057),
        ];
        break;
      case '6':
        return [
          const Color(0xFFF7797D),
          const Color(0xFFFBD786),
          const Color(0xFFC6FFDD),
        ];
        break;
      case '7':
        return [
          const Color(0xFF536976),
          const Color(0xFF292E49),
        ];
        break;
      case '8':
        return [
          const Color(0xFFFF5F6D),
          const Color(0xFFFFC371),
        ];
        break;
      default:
        return [Colors.green, Colors.green.shade50];
    }
  }

  static LinearGradient linearGradient(int index) {
    return LinearGradient(
      colors: CustomColor()._gradientColor(index),
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
