import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/constants/strings.dart';
import 'package:sizer/sizer.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76.0.w,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: const Text(
        Strings.appHeader,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 35,
          fontFamily: 'Anton',
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
