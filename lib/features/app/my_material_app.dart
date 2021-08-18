import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_app/core/constants/strings.dart';
import 'package:rick_and_morty_app/core/di.dart';
import 'package:rick_and_morty_app/core/themes/app_theme.dart';
import 'package:rick_and_morty_app/data/db/models/character_location_model.dart';
import 'package:rick_and_morty_app/data/db/models/character_model.dart';
import 'package:rick_and_morty_app/data/db/models/search_request_model.dart';
import 'package:rick_and_morty_app/features/app/router.dart';
import 'package:sizer/sizer.dart';

class MyMaterialApp extends StatefulWidget {
  const MyMaterialApp();

  @override
  _MyMaterialAppState createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  @override
  void initState() {
    // Todo: Create init store (di, db)
    // init();

    // Hive.initFlutter();

    // Hive
    //   ..registerAdapter(SearchRequestModelAdapter())
    //   ..registerAdapter(CharacterModelAdapter())
    //   ..registerAdapter(CharacterLocationModelAdapter());

    super.initState();
  }

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
