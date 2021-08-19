import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/features/app/logic/theme_store.dart';

import 'my_material_app.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Space for global stores
    return Provider(
      create: (context) => ThemeStore(),
      child: const MyMaterialApp(),
    );
  }
}
