import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty_app/core/constants/colors.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xfff2f2f2);
  static Color lightPrimaryColor = const Color(0xfff2f2f2);
  static Color lightAccentColor = Colors.blueGrey.shade200;
  static Color lightParticlesColor = const Color(0x44948282);

  static Color darkBackgroundColor = const Color(0xFF1A2127);
  static Color darkPrimaryColor = const Color(0xFF1A2127);
  static Color darkAccentColor = Colors.blueGrey.shade600;
  static Color darkParticlesColor = const Color(0x441C2A3D);

  const AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    accentColor: lightAccentColor,
    backgroundColor: lightBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    secondaryHeaderColor: CustomColors.nearlyBlue,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    accentColor: darkAccentColor,
    backgroundColor: darkBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    secondaryHeaderColor: Colors.black,
  );

  static Brightness? get currentSystemBrightness =>
      SchedulerBinding.instance?.window.platformBrightness;

  static void setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: themeMode == ThemeMode.light
          ? lightBackgroundColor
          : darkBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}

extension ThemeExtras on ThemeData {
  Color get particlesColor => brightness == Brightness.light
      ? AppTheme.lightParticlesColor
      : AppTheme.darkParticlesColor;
}
