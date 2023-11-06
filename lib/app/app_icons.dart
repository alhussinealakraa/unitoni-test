import 'package:flutter/material.dart';

class AppIcons {
  /// Lottie Animations
  static final lostConnection = AssetImage("image_loader".pngImage);


}

extension GetAssetPath on String {

  String get svgImage => 'assets/images/$this.svg';

  String get pngImage => 'assets/images/$this.png';

  String get jpeg => 'assets/images/$this.jpeg';

  String get jpg => 'assets/images/$this.jpg';
}
