import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:miniplayer/miniplayer.dart';

class Const {
  // private constructor
  Const._() {
    throw new AssertionError("private Constructor");
  }

  // app-service-hose
  static const String APP_SERVIE_HOST = 'app-service.au-syd.mybluemix.net';

  // rooting No
  static const int routingNoLounge = 0;
  static const int routingNoExplore = 1;
  static const int routingNoEvent = 2;
  static const int routingNoProfile = 3;
  // static const int routingNoCut = 3;

  // size
  static final double containerWidthPercentage = 0.95;
  static final double containerHightPercentage = 0.95;

  static final double refreshIndicatorDisplacement = 100.0;

  static final double miniPlayerMinimumSize = 60;

  //// size event card
  static final double eventCardWidthSizePercentage = 0.90;
  // size
  static final double footerHeight = 75;
  static final double roomTypeIconSize = 80;

  // size header button container height
  static final double headerButtonContainerHeight = kToolbarHeight * 0.8;

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

  // カメラから画像を取得
  static Future<XFile> getImageFromCamera() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      return pickedFile;
    } on PlatformException catch (err) {
      print(err);
    } on Exception catch (err) {
      print(err);
    }
    return null;
  }

  // ギャラリーから画像を取得
  static Future<XFile> getImageFromGallery() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      return pickedFile;
    } on PlatformException catch (err) {
      print(err);
    } on Exception catch (err) {
      print(err);
    }
    return null;
  }

  static Future<File> cropImage(
      {BuildContext context, @required String sourcePath}) async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: sourcePath,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
        statusBarColor: Colors.black,
        toolbarTitle: "",
        toolbarColor: Colors.black,
        toolbarWidgetColor: Colors.white,
        backgroundColor: Colors.black,
        cropFrameColor: Colors.transparent,
        showCropGrid: false,
        hideBottomControls: true,
        initAspectRatio: CropAspectRatioPreset.original,
      ),
      iosUiSettings: IOSUiSettings(
        hidesNavigationBar: true,
        aspectRatioPickerButtonHidden: true,
        doneButtonTitle: "切り抜く",
        cancelButtonTitle: "戻る",
      ),
      cropStyle: CropStyle.rectangle,
    );
    return croppedFile;
  }
  // 別アプリを開く
  // static Future launchURL(String url, {String secondUrl}) async {
  //   print("url: $url");
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else if (secondUrl != null && await canLaunch(secondUrl)) {
  //     print("second!");
  //     await launch(secondUrl);
  //   } else {
  //     var label;
  //     secondUrl != null ? label = url : label = url + ' and ' + secondUrl;
  //     throw 'Could not launch $label';
  //   }
  // }
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

class GradientBorder extends Border {
  final Gradient borderGradient;
  final double width;

  const GradientBorder({this.width = 0.0, @required this.borderGradient})
      : assert(borderGradient != null),
        super();

  @override
  void paint(Canvas canvas, Rect rect,
      {TextDirection textDirection,
      BoxShape shape = BoxShape.rectangle,
      BorderRadius borderRadius}) {
    if (isUniform) {
      switch (shape) {
        case BoxShape.circle:
          assert(borderRadius == null,
              'A borderRadius can only be given for rectangular boxes.');
          this._paintGradientBorderWithCircle(canvas, rect);
          break;
        case BoxShape.rectangle:
          if (borderRadius != null) {
            this._paintGradientBorderWithRadius(canvas, rect, borderRadius);
            return;
          }
          this._paintGradientBorderWithRectangle(canvas, rect);
          break;
      }
      return;
    }
  }

  void _paintGradientBorderWithRadius(
      Canvas canvas, Rect rect, BorderRadius borderRadius) {
    final Paint paint = Paint();
    final RRect outer = borderRadius.toRRect(rect);

    paint.shader = borderGradient.createShader(outer.outerRect);

    if (width == 0.0) {
      paint
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.0;
      canvas.drawRRect(outer, paint);
    } else {
      final RRect inner = outer.deflate(width);
      canvas.drawDRRect(outer, inner, paint);
    }
  }

  void _paintGradientBorderWithCircle(Canvas canvas, Rect rect) {
    final double radius = (rect.shortestSide - width) / 2.0;
    final Paint paint = Paint();
    paint
      ..strokeWidth = width
      ..style = PaintingStyle.stroke
      ..shader = borderGradient
          .createShader(Rect.fromCircle(center: rect.center, radius: radius));

    canvas.drawCircle(rect.center, radius, paint);
  }

  void _paintGradientBorderWithRectangle(Canvas canvas, Rect rect) {
    final Paint paint = Paint();
    paint
      ..strokeWidth = width
      ..shader = borderGradient.createShader(rect)
      ..style = PaintingStyle.stroke;

    canvas.drawRect(rect.deflate(width / 2.0), paint);
  }

  factory GradientBorder.uniform({
    Gradient gradient = const LinearGradient(colors: [Color(0x00000000)]),
    double width = 1.0,
  }) {
    return GradientBorder._fromUniform(gradient, width);
  }

  const GradientBorder._fromUniform(Gradient gradient, double width)
      : assert(gradient != null),
        assert(width >= 0.0),
        borderGradient = gradient,
        width = width;
}
