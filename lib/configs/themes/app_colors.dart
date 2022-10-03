import 'package:flutter/material.dart';
import 'package:test_app/configs/themes/app_light_theme.dart';
import 'package:test_app/configs/themes/ui_parameters.dart';

import 'app_dark_theme.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradiantLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryLightColorLight,
    primaryColorLight
  ]
);

const mainGradiantDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryDarkColorDark,
    primaryColorDark
  ]
);

LinearGradient mainGradient() => UIParameters.isDarkMode() ? mainGradiantDark : mainGradiantLight;

Color customScaffoldColor(BuildContext context) => UIParameters.isDarkMode() ? const Color(0xFF2e3c62) : const Color.fromARGB(255, 240, 237, 255);
