import 'package:alkababgee/core/helper/enums.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';


SnackBar customSnackBar(
    {required String text,
    required ColorState colorState,
    SnackBarBehavior behavior = SnackBarBehavior.fixed}) {
  return SnackBar(
    duration: const Duration(
      seconds: 2,
    ),
    content: CustomText(
      text: text,
      style: TextStyleManager.textStyle15w500,
    ),
    backgroundColor: ColorsManager.colorState(colorState),
    behavior: behavior,
  );
}