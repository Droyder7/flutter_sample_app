import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static Orientation? orientation;
  static late double _screenWidth,
      _screenHeight,
      _safeAreaWidth,
      _safeAreaHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    orientation = _mediaQueryData.orientation;
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;

    var padding = _mediaQueryData.padding;
    _safeAreaWidth = _screenWidth - padding.left - padding.right;
    _safeAreaHeight = _screenHeight - padding.top - padding.bottom;
  }

  static double get screenWidth => _screenWidth;
  static double get screenHeight => _screenHeight;
  static double get safeAreaWidth => _safeAreaWidth;
  static double get safeAreaHeight => _safeAreaHeight;
}

double getWidth([double percent = 100]) {
  return SizeConfig.safeAreaWidth * percent / 100;
}

double getHeight([double percent = 100]) {
  return SizeConfig.safeAreaHeight * percent / 100;
}

double getFontSize([double size = 1]) {
  return SizeConfig.safeAreaWidth * size / 411;
}

/* Widget getText(String text, {double size = 1, Color color = Colors.black}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: getFontSize(size),
      color: color,
    ),
  );
} */