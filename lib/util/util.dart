import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Const {
  // rooting No
  static final int routingNoHome = 0;
  static final int routingNoExplore = 1;
  static final int routingNoLounge = 2;
  static final int routingNoEvent = 3;
  static final int routingNoMessage = 4;

  // size
  static final double containerWidthPercentage = 0.9;
  static final double containerHightPercentage = 0.9;

  static final double refreshIndicatorDisplacement = 100.0;

  // label
  static final String assetDirName = 'images';
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
    return year + "/" + month + "/" + day;
  }
}
