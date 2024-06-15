import 'dart:developer';

import 'package:alkababgee/core/constant/keys.dart';
import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/routes/routes.dart';
import 'package:alkababgee/core/services/cache_service.dart';
import 'package:alkababgee/firebase/firebase_firestore_service.dart';
import 'package:alkababgee/firebase/tables_name.dart';
import 'package:alkababgee/model/food/food_model.dart';
import 'package:alkababgee/model/order/order_model.dart';
import 'package:alkababgee/model/table/table_reservation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../model/amount_model.dart';
import '../../model/item_list_model.dart';

class PaymentPage2 extends StatelessWidget {
  final TableReservationModel tableReservationModel;
  const PaymentPage2({
    super.key,
    required this.tableReservationModel,
  });

  @override
  Widget build(BuildContext context) {
    var transactionData = getTransactionData();

    return Scaffold(
      body: PaypalCheckoutView(
        sandboxMode: true,
        clientId: Keys.clientID,
        secretKey: Keys.secretID,
        transactions: [
          {
            "amount": transactionData.amountModel.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) {
          log("onSuccess: $params");
          FirebaseFireStoreService.addData(
            tableName: TablesName.reservation,
            data: tableReservationModel.toJson(),
          );
          context.pushNamedAndRemoveUntil(
            Routes.homeScreen,
            predicate: (route) => false,
          );
          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: "Booked a table successfully",
          );
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    );
  }

  // records
  ({AmountModel amountModel, ItemListModel itemList}) getTransactionData() {
    //item list model
    List<OrderItemModel> orderItemModel = [
      // OrderItemModel(
      //   currency: "USD",
      //   name: "Apple",
      //   price: "4",
      //   quantity: 10,
      // ),
      // OrderItemModel(
      //   currency: "USD",
      //   name: "Apple",
      //   price: "5",
      //   quantity: 12,
      // ),
    ];
    ItemListModel itemList = ItemListModel(items: orderItemModel);
    // amount model
    AmountModel amountModel = AmountModel(
      currency: 'USD',
      details: Details(
        shipping: "0",
        shippingDiscount: 0,
        subtotal: "${10}",
      ),
      total: "${10}",
    );
    return (amountModel: amountModel, itemList: itemList);
  }
}
