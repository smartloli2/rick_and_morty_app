import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/constants/strings.dart';
import 'package:rick_and_morty_app/core/themes/app_theme.dart';
import 'package:rick_and_morty_app/features/app/router.dart';
import 'package:sizer/sizer.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: Strings.appHeader,
          // Todo(dartloli): move all colors to themes
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          // Todo(dartloli): add themeMode
          debugShowCheckedModeBanner: false,
          initialRoute: AppRouter.initialRoute,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      },
    );
  }
}
