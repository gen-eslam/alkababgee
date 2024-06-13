import 'package:alkababgee/core/constant/space_Manager.dart';
import 'package:alkababgee/core/constant/string_manager.dart';
import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:alkababgee/core/widgets/custom_text_form_field.dart';
import 'package:alkababgee/presentation/home/view/widget/category_list.dart';
import 'package:alkababgee/presentation/home/view/widget/coustom_search_bar.dart';
import 'package:alkababgee/presentation/home/view/widget/custom_app_bar.dart';
import 'package:alkababgee/presentation/home/view/widget/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: context.deviceWidth * 0.03,
            left: context.deviceWidth * 0.03,
            right: context.deviceWidth * 0.03,
          ),
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: CustomAppBar()),
              const SliverToBoxAdapter(
                child: CustomSearchBar(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: context.deviceHeight * 0.02),
                  child: CustomText(
                    text: "Categories",
                    textAlign: TextAlign.start,
                    color: ColorsManager.deepRed,
                    style: TextStyleManager.textStyle20w600.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: CategoryList(),
              ),
              const SliverToBoxAdapter(
                child: CustomGridView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
