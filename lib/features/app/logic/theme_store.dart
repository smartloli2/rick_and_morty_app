import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty_app/core/themes/app_theme.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStoreBase with _$ThemeStore;

abstract class _ThemeStoreBase with Store {
  @observable
  ThemeMode themeMode = ThemeMode.light;

  Brightness get currentSystemBrightness =>
      SchedulerBinding.instance!.window.platformBrightness;

  @action
  void toggleTheme() {
    themeMode == ThemeMode.light
        ? _setTheme(ThemeMode.dark)
        : _setTheme(ThemeMode.light);
  }

  @action
  void updateAppTheme() {
    final Brightness currentBrightness = currentSystemBrightness;
    currentBrightness == Brightness.light
        ? _setTheme(ThemeMode.light)
        : _setTheme(ThemeMode.dark);
  }

  void _setTheme(ThemeMode newThemeMode) {
    AppTheme.setStatusBarAndNavigationBarColors(newThemeMode);
    themeMode = newThemeMode;
  }
}
