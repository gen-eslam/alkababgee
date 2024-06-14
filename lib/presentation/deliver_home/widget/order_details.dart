import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:alkababgee/model/food/food_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
    required this.foodModel,
  });

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.deviceWidth,
      padding: EdgeInsets.all(
        10.r,
      ),
      margin: EdgeInsets.all(
        10.r,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsManager.deepRed,
          width: 3.r,
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Order Details :',
            color: ColorsManager.deepRed,
            style: TextStyleManager.textStyle18w600,
          ),
          const Divider(
            color: Colors.transparent,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
                child: Image.network(
                  foodModel.image,
                  width: context.deviceWidth * 0.3,
                  height: context.deviceWidth * 0.2,
                  fit: BoxFit.cover,
                ),
              ),
              const VerticalDivider(
                color: Colors.transparent,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: foodModel.name,
                    color: ColorsManager.deepRed,
                    style: TextStyleManager.textStyle18w600,
                  ),
                  CustomText(
                    text: "${foodModel.price} \$",
                    color: ColorsManager.deepRed,
                    style: TextStyleManager.textStyle18w600,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: foodModel.rating.toString(),
                        color: ColorsManager.deepRed,
                        style: TextStyleManager.textStyle18w600,
                      ),
                      const Icon(
                        Icons.star,
                        color: ColorsManager.yellow,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            color: Colors.transparent,
          ),
          Row(
            children: [
              CustomText(
                text: 'Quantity :',
                color: ColorsManager.deepRed,
                style: TextStyleManager.textStyle18w600,
              ),
              CustomText(
                text: '${foodModel.quantity}',
                color: ColorsManager.deepRed,
                style: TextStyleManager.textStyle18w600,
              ),
            ],
          ),
          const Divider(
            color: Colors.transparent,
          ),
          Row(
            children: [
              CustomText(
                text: 'Spices Degree :',
                color: ColorsManager.deepRed,
                style: TextStyleManager.textStyle18w600,
              ),
              CustomText(
                text: '${foodModel.spicy} %',
                color: ColorsManager.deepRed,
                style: TextStyleManager.textStyle18w600,
              ),
            ],
          ),
          const Divider(
            color: Colors.transparent,
          ),
          Row(
            children: [
              CustomText(
                text: 'Total Price :',
                color: ColorsManager.deepRed,
                style: TextStyleManager.textStyle18w600,
              ),
              CustomText(
                text: '${foodModel.quantity * foodModel.price} \$',
                color: ColorsManager.deepRed,
                style: TextStyleManager.textStyle18w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
