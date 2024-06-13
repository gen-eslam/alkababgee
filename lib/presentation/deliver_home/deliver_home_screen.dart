import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:alkababgee/model/food/food_model.dart';
import 'package:flutter/material.dart';

class DeliverHomeScreen extends StatelessWidget {
  final FoodModel foodModel;
  const DeliverHomeScreen({super.key, required this.foodModel});

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
        title: const Text('Deliver Home'),
      ),
      body: Column(
        children: [
        
        ],
      ),
    );
  }
}
