import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_elevated_button.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:alkababgee/model/table/table_model.dart';
import 'package:alkababgee/model/table/table_reservation.dart';
import 'package:alkababgee/presentation/payment/view/pages/payment_ui2.dart';
import 'package:alkababgee/presentation/tables/booking_table_cubit/booking_table_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class BookingTableScreen extends StatelessWidget {
  final TableModel tableModel;
  const BookingTableScreen({super.key, required this.tableModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsManager.deepRed,
        foregroundColor: ColorsManager.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: CustomText(
          text: "Booking Table",
          style: TextStyleManager.textStyle18w600,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          bottom: 10.r,
          left: 10.r,
          right: 10.r,
          top: 30.r,
        ),
        width: context.deviceWidth,
        padding: EdgeInsets.all(10.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Table Details",
              style: TextStyleManager.textStyle18w600,
              color: ColorsManager.deepRed,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: ColorsManager.deepRed,
                  width: 3.r,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Table Name : ${tableModel.name}",
                    color: ColorsManager.deepRed,
                    style: TextStyleManager.textStyle18w600,
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  CustomText(
                    text: "Table Status : ${tableModel.status}",
                    color: ColorsManager.deepRed,
                    style: TextStyleManager.textStyle18w600,
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  CustomText(
                    text: "number of seats : ${tableModel.capacity}",
                    color: ColorsManager.deepRed,
                    style: TextStyleManager.textStyle18w600,
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            CustomText(
              text: 'Select Date and Time to book ',
              style: TextStyleManager.textStyle18w600,
              color: ColorsManager.deepRed,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: ColorsManager.deepRed,
                  width: 3.r,
                ),
              ),
              child: BlocBuilder<BookingTableCubit, BookingTableState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text:
                            'Date : ${BookingTableCubit.get(context).getDateOnly()}',
                        style: TextStyleManager.textStyle18w600,
                        color: ColorsManager.deepRed,
                      ),
                      const Divider(
                        color: Colors.transparent,
                      ),
                      CustomText(
                        text:
                            'Time : ${BookingTableCubit.get(context).getTimeOnly()}',
                        style: TextStyleManager.textStyle18w600,
                        color: ColorsManager.deepRed,
                      ),
                    ],
                  );
                },
              ),
            ),
            const Divider(
              color: Colors.transparent,
            ),
            CustomElevatedButton(
              onPressed: () async {
                BookingTableCubit.get(context).date =
                    await showOmniDateTimePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    const Duration(days: 3652),
                  ),
                  is24HourMode: false,
                  isShowSeconds: false,
                  minutesInterval: 1,
                  secondsInterval: 1,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  constraints: const BoxConstraints(
                    maxWidth: 350,
                    maxHeight: 650,
                  ),
                  transitionBuilder: (context, anim1, anim2, child) {
                    return FadeTransition(
                      opacity: anim1.drive(
                        Tween(
                          begin: 0,
                          end: 1,
                        ),
                      ),
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(
                    milliseconds: 200,
                  ),
                  barrierDismissible: true,
                ).then((value) {
                  BookingTableCubit.get(context).emit(ChangeDateState());
                  return value ?? BookingTableCubit.get(context).date;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: ColorsManager.white,
                  ),
                  CustomText(
                    text: "Select Date & Time",
                    color: ColorsManager.white,
                    style: TextStyleManager.textStyle18w600,
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.transparent,
              height: 30.r,
            ),
            CustomText(
              text: "Note : booking table Price is 10 \$",
              style: TextStyleManager.textStyle18w600,
              color: ColorsManager.deepRed,
            ),
            const Divider(
              color: Colors.transparent,
              // height: 30.r,
            ),
            CustomElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PaymentPage2(
                      tableReservationModel: TableReservationModel(
                        capacity: tableModel.capacity,
                        date: BookingTableCubit.get(context).getDateOnly(),
                        time: BookingTableCubit.get(context).getTimeOnly(),
                        name: tableModel.name,
                        userName:
                            BookingTableCubit.get(context).userModel!.name!,
                        email: BookingTableCubit.get(context).userModel!.email!,
                        uid: BookingTableCubit.get(context).userModel!.uid!,
                      ),
                    ),
                  ),
                );
              },
              child: CustomText(
                text: "Book Now",
                color: ColorsManager.white,
                style: TextStyleManager.textStyle18w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
