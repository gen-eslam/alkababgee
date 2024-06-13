import 'package:alkababgee/core/constant/space_Manager.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color color;
  const CustomElevatedButton({
    super.key,
    required this.child,
    this.color = ColorsManager.yellow,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppPadding.p16,
            ),
          ),
          minimumSize: Size(double.infinity, 50.r),
          padding: EdgeInsets.zero,
          backgroundColor: color,
        ),
        child: child);
  }
}
