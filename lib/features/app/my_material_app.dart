import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/core/constants/strings.dart';
import 'package:rick_and_morty_app/core/themes/app_theme.dart';
import 'package:rick_and_morty_app/features/app/router.dart';
import 'package:sizer/sizer.dart';

import 'logic/theme_store.dart';

class MyMaterialApp extends StatefulWidget {
  const MyMaterialApp();

  @override
  _MyMaterialAppState createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp>
    with WidgetsBindingObserver {
  @override
  void didChangePlatformBrightness() {
    context.read<ThemeStore>().updateAppTheme();
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Observer(
          builder: (context) => MaterialApp(
            title: Strings.appHeader,
            // Todo(dartloli): move all colors to themes
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode:
                context.select((ThemeStore themeStore) => themeStore.themeMode),
            debugShowCheckedModeBanner: false,
            initialRoute: AppRouter.initialRoute,
            onGenerateRoute: AppRouter.onGenerateRoute,
          ),
        );
      },
    );
  }
}
