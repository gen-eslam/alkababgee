import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.deviceHeight * 0.04),
      child: const CustomTextFormFeild(
        text: "Search",
        prefixIcon: Icons.search,
      ),
    );
  }
}
