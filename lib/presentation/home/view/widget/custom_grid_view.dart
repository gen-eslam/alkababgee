import 'package:alkababgee/core/constant/images_manager.dart';
import 'package:alkababgee/core/fake_data/food_data.dart';
import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/routes/routes.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * 0.9,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 20.0.r, // spacing between rows
          crossAxisSpacing: 15.0.r, // spacing between columns
        ),
        padding: EdgeInsets.all(
          5.0.r,
        ), // padding around the grid
        itemCount: foodData.length, // total number of items
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.pushNamed(Routes.foodDetailsScreen,
                  arguments: foodData[index]);
            },
            child: AspectRatio(
              aspectRatio: 1 / 2,
              child: Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: ColorsManager.gray.withOpacity(0.2),
                      offset: const Offset(0, 0),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.network(
                          foodData[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.transparent,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: "${foodData[index].name} ",
                          style: TextStyleManager.textStyle14w600,
                          color: ColorsManager.deepRed,
                        ),
                        const Spacer(),
                        CustomText(
                          text: "${foodData[index].rating}",
                          style: TextStyleManager.textStyle14w600,
                          color: ColorsManager.deepRed,
                        ),
                        Icon(
                          Icons.star,
                          color: ColorsManager.yellow,
                          size: 15.r,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
