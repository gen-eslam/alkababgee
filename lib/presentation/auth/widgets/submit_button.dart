import 'package:alkababgee/core/constant/string_manager.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_elevated_button.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SubmitButtom extends StatelessWidget {
  final void Function()? onPressed;
  const SubmitButtom({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: onPressed,
      child: CustomText(
        text: StringManager.submit,
        color: ColorsManager.white,
        style: TextStyleManager.textStyle18w600,
      ),
    );
  }
}
