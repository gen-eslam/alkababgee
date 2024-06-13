import 'dart:developer';

import 'package:alkababgee/core/constant/keys.dart';
import 'package:alkababgee/core/services/cache_service.dart';
import 'package:alkababgee/model/auth/user_model.dart';
import 'package:alkababgee/presentation/payment/model/payment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../../../firebase/firebase_firestore_service.dart';
import '../../../../firebase/tables_name.dart';
import '../../model/amount_model.dart';
import '../../model/item_list_model.dart';

class PaymentPage extends StatelessWidget {
  final int money;
  const PaymentPage({
    super.key,
    required this.money,
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
          FirebaseFireStoreService.getOneData<UserModel>(
                  tableName: TablesName.users,
                  pram: 'uid',
                  pramValue: CacheService.getDataString(key: Keys.userId),
                  fromJson: UserModel.fromJson)
              .then((value) async {
            await FirebaseFireStoreService.addData(
              tableName: TablesName.payment,
              data: PaymentModel(
                email: value!.email,
                name: value.name,
                userUid: value.uid,
                price: money.toString(),
              ).toJson(),
            );
          });
          Navigator.pop(context);
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
        subtotal: "$money",
      ),
      total: "$money",
    );
    return (amountModel: amountModel, itemList: itemList);
  }
}
