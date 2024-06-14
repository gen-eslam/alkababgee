import 'package:alkababgee/core/constant/keys.dart';
import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/services/cache_service.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:alkababgee/firebase/firebase_firestore_service.dart';
import 'package:alkababgee/firebase/tables_name.dart';
import 'package:alkababgee/model/auth/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({
    super.key,
  });

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.deviceWidth,
      height: context.deviceHeight * 0.15,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: ColorsManager.deepRed,
        borderRadius: BorderRadius.circular(
          20.r,
        ),
      ),
      child: FutureBuilder(
          future: FirebaseFireStoreService.getOneData<UserModel>(
              tableName: TablesName.users,
              pram: 'uid',
              pramValue: CacheService.getDataString(key: Keys.userId),
              fromJson: UserModel.fromJson),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: 'My Account',
                    color: ColorsManager.white,
                    style: TextStyleManager.textStyle18w400,
                  ),
                  CustomText(
                    text: '${snapShot.data?.name}',
                    color: ColorsManager.white,
                    style: TextStyleManager.textStyle18w400,
                  ),
                  CustomText(
                    text: '${snapShot.data?.email}',
                    color: ColorsManager.white,
                    style: TextStyleManager.textStyle18w400,
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.white,
                ),
              );
            }
          }),
    );
  }
}
