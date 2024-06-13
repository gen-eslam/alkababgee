import 'package:alkababgee/core/constant/images_manager.dart';
import 'package:alkababgee/core/constant/keys.dart';
import 'package:alkababgee/core/constant/string_manager.dart';
import 'package:alkababgee/core/routes/routes.dart';
import 'package:alkababgee/core/services/cache_service.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      String? userId = CacheService.getDataString(
        key: Keys.userId,
      );

      if (userId != null) {
        Navigator.pushReplacementNamed(context, Routes.homeScreen);
      } else {
        Navigator.pushReplacementNamed(context, Routes.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(ImagesManager.logo),
          CustomText(
            text: StringManager.alkababgee,
            color: ColorsManager.deepRed,
            style: TextStyleManager.textStyle30w700,
          ),
        ],
      ),
    );
  }
}
