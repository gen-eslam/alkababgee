import 'package:alkababgee/core/constant/keys.dart';
import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/services/cache_service.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:alkababgee/firebase/firebase_firestore_service.dart';
import 'package:alkababgee/firebase/tables_name.dart';
import 'package:alkababgee/model/auth/user_model.dart';
import 'package:alkababgee/model/order/order_model.dart';
import 'package:alkababgee/presentation/deliver_home/widget/order_details.dart';
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

class MyOrderdList extends StatelessWidget {
  const MyOrderdList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * 0.25,
      child: FutureBuilder(
          future: FirebaseFireStoreService.getFilteredData<OrderModel>(
            tableName: TablesName.order,
            pram: 'uid',
            pramValue: CacheService.getDataString(key: Keys.userId),
            fromJson: OrderModel.fromJson,
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
                        borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        border: Border.all(
                          color: ColorsManager.deepRed,
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                10.r,
                              ),
                              child: Image.network(
                                snapShot.data![index]!.image,
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
                                  text: snapShot.data![index]!.name,
                                  color: ColorsManager.deepRed,
                                  style: TextStyleManager.textStyle18w600,
                                ),
                                CustomText(
                                  text: "${snapShot.data![index]!.price} \$",
                                  color: ColorsManager.deepRed,
                                  style: TextStyleManager.textStyle18w600,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text:
                                          "quantity : ${snapShot.data![index]!.quantity}",
                                      color: ColorsManager.deepRed,
                                      style: TextStyleManager.textStyle18w600,
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
                        CustomText(
                          text: 'Order Id : ${snapShot.data![index]?.orderId}',
                          textAlign: TextAlign.center,
                          color: ColorsManager.deepRed,
                          style: TextStyleManager.textStyle18w600,
                        ),
                        CustomText(
                          text:
                              'Order status : ${snapShot.data![index]?.orderStatus}',
                          textAlign: TextAlign.center,
                          color: ColorsManager.deepRed,
                          style: TextStyleManager.textStyle18w600,
                        ),
                        CustomText(
                          text:
                              'total Price : ${snapShot.data![index]?.total} \$',
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
    );
  }
}
