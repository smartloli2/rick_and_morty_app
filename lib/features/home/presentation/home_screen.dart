import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'widgets/header_widget.dart';
import 'widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HeaderWidget(),
            SizedBox(height: 2.0.h),
            GestureDetector(
              onTap: () {},
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
