import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rick_and_morty_app/core/constants/colors.dart';
import 'package:rick_and_morty_app/core/constants/strings.dart';
import 'package:sizer/sizer.dart';

class SearchBarWidget extends HookWidget {
  final bool isPoppable;

  const SearchBarWidget({this.isPoppable = false});

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return SizedBox(
      width: 75.0.w,
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.paleBlue,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: const [
            BoxShadow(
              blurRadius: 1,
              color: Colors.black26,
              offset: Offset(0, 0.5),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            onChanged: (value) {},
            controller: textEditingController,
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.bold,
              fontSize: 14.0.sp,
              color: CustomColors.nearlyBlue,
            ),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: isPoppable
                  ? GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.arrow_back,
                        color: CustomColors.grey,
                      ),
                    )
                  : null,
              suffixIcon: const Icon(Icons.search, color: CustomColors.grey),
              hintText: Strings.searchBarHint,
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 13.0.sp,
              ),
            ),
            onEditingComplete: () {},
          ),
        ),
      ),
    );
  }
}
