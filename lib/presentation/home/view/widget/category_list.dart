import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      height: context.deviceHeight * 0.05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            color: ColorsManager.deepRed,
            child: AspectRatio(
              aspectRatio: 2 / 1,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.r),
                child: CustomText(
                  textAlign: TextAlign.center,
                  text: "TEST",
                  style: TextStyleManager.textStyle14w600,
                  color: ColorsManager.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
