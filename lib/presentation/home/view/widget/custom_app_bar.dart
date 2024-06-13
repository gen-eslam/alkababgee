
import 'package:alkababgee/core/constant/string_manager.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            CustomText(
              text: StringManager.alkababgee,
              color: ColorsManager.yellow,
              style: TextStyleManager.textStyle36w700,
            ),
            CustomText(
              text: StringManager.orderyoutfavoritefood,
              color: ColorsManager.gray,
              style: TextStyleManager.textStyle18w400,
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.deepRed,
            borderRadius: BorderRadius.circular(
              10.r,
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: ColorsManager.white,
              size: 30.r,
            ),
          ),
        ),
      ],
    );
  }
}
