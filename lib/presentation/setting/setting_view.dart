import 'package:alkababgee/core/constant/keys.dart';
import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/routes/routes.dart';
import 'package:alkababgee/core/services/cache_service.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_elevated_button.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:alkababgee/firebase/firebase_firestore_service.dart';
import 'package:alkababgee/firebase/tables_name.dart';
import 'package:alkababgee/model/order/order_model.dart';
import 'package:alkababgee/model/table/table_reservation.dart';
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
            const Divider(
              color: Colors.transparent,
            ),
            CustomText(
              text: "My Bookings",
              color: ColorsManager.deepRed,
              style: TextStyleManager.textStyle18w600,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            SizedBox(
              height: context.deviceHeight * 0.20,
              child: FutureBuilder(
                  future: FirebaseFireStoreService.getFilteredData<
                      TableReservationModel>(
                    tableName: TablesName.reservation,
                    pram: 'uid',
                    pramValue: CacheService.getDataString(key: Keys.userId),
                    fromJson: TableReservationModel.fromJson,
                  ),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      return ListView.builder(
                        itemCount: snapShot.data!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10.r),
                            padding: EdgeInsets.all(10.r),
                            width: context.deviceWidth * 0.9,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r)),
                                border: Border.all(
                                  color: ColorsManager.deepRed,
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text:
                                      'Table Name : ${snapShot.data![index]?.name}',
                                  textAlign: TextAlign.center,
                                  color: ColorsManager.deepRed,
                                  style: TextStyleManager.textStyle18w600,
                                ),
                                CustomText(
                                  text:
                                      'number of seats : ${snapShot.data![index]?.capacity}',
                                  textAlign: TextAlign.center,
                                  color: ColorsManager.deepRed,
                                  style: TextStyleManager.textStyle18w600,
                                ),
                                CustomText(
                                  text:
                                      'date : ${snapShot.data![index]?.date} \$',
                                  textAlign: TextAlign.center,
                                  color: ColorsManager.deepRed,
                                  style: TextStyleManager.textStyle18w600,
                                ),
                                CustomText(
                                  text:
                                      'time : ${snapShot.data![index]?.time} ',
                                  textAlign: TextAlign.center,
                                  color: ColorsManager.deepRed,
                                  style: TextStyleManager.textStyle18w600,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: ColorsManager.deepRed,
                      ));
                    }
                  }),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            CustomElevatedButton(
              child: CustomText(
                  text: 'Logout', style: TextStyleManager.textStyle18w600),
              onPressed: () {
                CacheService.removeData(key: Keys.userId);
                context.pushNamedAndRemoveUntil(Routes.loginScreen,
                    predicate: (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
