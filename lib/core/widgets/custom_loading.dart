import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: ColorsManager.yellow,
    ));
  }
}
