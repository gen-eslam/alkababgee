import 'package:alkababgee/core/constant/string_manager.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_elevated_button.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:alkababgee/core/widgets/slider_fb3.dart';
import 'package:alkababgee/model/food/food_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodDetailsScreen extends StatelessWidget {
  final FoodModel foodModel;
  const FoodDetailsScreen({super.key, required this.foodModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsManager.deepRed,
        foregroundColor: ColorsManager.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: CustomText(
          text: "Food Details",
          style: TextStyleManager.textStyle18w600,
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(10.r),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.network(
                    foodModel.image,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(10.r),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: foodModel.name,
                        style: TextStyleManager.textStyle24w500,
                        color: ColorsManager.deepRed,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Price:",
                              style: TextStyleManager.textStyle15w700
                                  .copyWith(color: ColorsManager.deepRed),
                              children: [
                            TextSpan(
                              text: " 200 \$",
                              style: TextStyleManager.textStyle15w700
                                  .copyWith(color: ColorsManager.deepRed),
                            )
                          ]))
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: ColorsManager.yellow,
                      ),
                      CustomText(
                        text: "${foodModel.rating}",
                        style: TextStyleManager.textStyle15w700,
                        color: ColorsManager.yellow,
                      ),
                      const VerticalDivider(
                        color: Colors.transparent,
                      ),
                      RichText(
                        text: TextSpan(
                          text: foodModel.mins.toString(),
                          style: TextStyleManager.textStyle15w700
                              .copyWith(color: ColorsManager.deepRed),
                          children: [
                            TextSpan(
                              text: "  Mins",
                              style: TextStyleManager.textStyle15w700
                                  .copyWith(color: ColorsManager.deepRed),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  CustomText(
                    textAlign: TextAlign.start,
                    text: foodModel.description,
                    style: TextStyleManager.textStyle18w600,
                    color: ColorsManager.gray,
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.r),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Spices",
                                    style: TextStyleManager.textStyle15w900,
                                    color: ColorsManager.yellow,
                                  ),
                                  const Divider(
                                    color: Colors.transparent,
                                  ),
                                  SliderFb3(
                                    min: 0,
                                    max: 100,
                                    accentColor: ColorsManager.white,
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.green,
                                        Colors.yellow,
                                        Colors.red,
                                      ],
                                    ),
                                    divisions: 10,
                                    onChange: (p0) {
                                      print(p0);
                                    },
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Quantity",
                                style: TextStyleManager.textStyle15w700,
                                color: ColorsManager.deepRed,
                              ),
                              StatefulBuilder(builder: (context, state) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        state(() {
                                          if (foodModel.quantity > 1) {
                                            foodModel.quantity--;
                                          }
                                        });
                                      },
                                      icon: const CircleAvatar(
                                        backgroundColor: ColorsManager.deepRed,
                                        child: Icon(
                                          Icons.remove,
                                          color: ColorsManager.white,
                                        ),
                                      ),
                                    ),
                                    CustomText(
                                      text: foodModel.quantity.toString(),
                                      style: TextStyleManager.textStyle15w700,
                                      color: ColorsManager.deepRed,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        state(() {
                                          foodModel.quantity++;
                                        });
                                      },
                                      icon: const CircleAvatar(
                                        backgroundColor: ColorsManager.deepRed,
                                        child: Icon(
                                          Icons.add,
                                          color: ColorsManager.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onPressed: () {},
                    child: CustomText(
                      text: "Deliver Home",
                      color: ColorsManager.white,
                      style: TextStyleManager.textStyle18w600,
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.transparent,
                ),
                Expanded(
                  child: CustomElevatedButton(
                    onPressed: () {},
                    child: CustomText(
                      text: "Book a Table",
                      color: ColorsManager.white,
                      style: TextStyleManager.textStyle18w600,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
