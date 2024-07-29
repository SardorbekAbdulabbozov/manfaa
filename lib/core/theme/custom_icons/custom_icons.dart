// Place fonts/CustomIcons.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: CustomIcons
//      fonts:
//       - asset: fonts/CustomIcons.ttf
import 'package:flutter/widgets.dart';

class CustomIcons {
  CustomIcons._();

  static const String _fontFamily = 'CustomIcons';

  static const IconData success = IconData(0xe900, fontFamily: _fontFamily);
}
