import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/search/presentation/search_screen.dart';

import 'package:sizer/sizer.dart';
import 'widgets/header_widget.dart';
import 'widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HeaderWidget(),
            SizedBox(height: 2.0.h),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(SearchScreen.routeName);
              },
              child: const AbsorbPointer(
                child: SearchBarWidget(),
              ),
            ),
            // Todo(dartloli): there will be recently viewed characters
            SizedBox(height: 30.0.h),
          ],
        ),
      ),
    );
  }
}
