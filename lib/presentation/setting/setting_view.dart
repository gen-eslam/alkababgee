import 'package:alkababgee/core/constant/keys.dart';
import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/services/cache_service.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:alkababgee/firebase/firebase_firestore_service.dart';
import 'package:alkababgee/firebase/tables_name.dart';
import 'package:alkababgee/model/order/order_model.dart';
import 'package:alkababgee/presentation/setting/widget/my_order_list.dart';
import 'package:alkababgee/presentation/setting/widget/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: ColorsManager.white,
        backgroundColor: ColorsManager.deepRed,
        title: const Text('Settings'),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorsManager.white,
          ),
        ),
      ),
      body: Container(
        width: context.deviceWidth,
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserDetails(),
            const Divider(
              color: Colors.transparent,
            ),
            CustomText(
              text: "My Orders",
              color: ColorsManager.deepRed,
              style: TextStyleManager.textStyle18w600,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            const MyOrderdList(),
            
          ],
        ),
      ),
    );
  }
}
