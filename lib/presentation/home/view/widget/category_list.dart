import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:alkababgee/presentation/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * 0.05,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return HomeCubit.get(context).foodData.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.deepRed,
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: HomeCubit.get(context).category.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        HomeCubit.get(context).changeIndex(index);
                      },
                      child: Card(
                        color: ColorsManager.deepRed,
                        child: AspectRatio(
                          aspectRatio: 2 / 1,
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.r),
                            child: CustomText(
                              textAlign: TextAlign.center,
                              text: HomeCubit.get(context)
                                  .category
                                  .elementAt(index),
                              style: TextStyleManager.textStyle14w600,
                              color: ColorsManager.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
