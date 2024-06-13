import 'package:alkababgee/core/constant/images_manager.dart';
import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class LogoAndWlcomeMessage extends StatelessWidget {
  final String tite;
  const LogoAndWlcomeMessage({
    super.key,
    required this.tite,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ImagesManager.logo,
          scale: 1 / 1,
          width: context.deviceWidth * 0.35,
        ),
        CustomText(
          text: tite,
          color: ColorsManager.yellow,
          style: TextStyleManager.textStyle32w700,
        ),
      ],
    );
  }
}
