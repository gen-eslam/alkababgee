import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/routes/routes.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_elevated_button.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:alkababgee/model/food/food_model.dart';
import 'package:alkababgee/presentation/deliver_home/widget/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DeliverHomeScreen extends StatefulWidget {
  final FoodModel foodModel;
  const DeliverHomeScreen({super.key, required this.foodModel});

  @override
  State<DeliverHomeScreen> createState() => _DeliverHomeScreenState();
}

class _DeliverHomeScreenState extends State<DeliverHomeScreen> {
  late Location location;
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;

  @override
  void initState() {
    location = Location();
    init();
    super.initState();
  }

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
        title: const Text(
          'Deliver Home',
        ),
      ),
      body: Column(
        children: [
          OrderDetails(
            foodModel: widget.foodModel,
          ),
          Container(
            height: context.deviceHeight * 0.35,
            width: MediaQuery.of(context).size.width * 0.9,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: FutureBuilder(
              future: location.getLocation(),
              builder: (context, data) {
                if (!data.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.deepRed,
                    ),
                  );
                } else {
                  return GoogleMap(
                    zoomControlsEnabled: false,
                    myLocationEnabled: true,
                    onMapCreated: (controller) {
                      controller.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: LatLng(
                              data.data!.latitude ?? 0,
                              data.data!.longitude ?? 0,
                            ),
                            zoom: 14,
                          ),
                        ),
                      );
                    },
                    initialCameraPosition: CameraPosition(
                      zoom: 14,
                      target: LatLng(
                        data.data!.latitude ?? 0,
                        data.data!.longitude ?? 0,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 55.r,
                vertical: 70.r,
              ),
              child: CustomElevatedButton(
                color: ColorsManager.deepRed,
                onPressed: () {
                  context.pushNamed(
                    Routes.paymentScreen,
                    arguments: widget.foodModel,
                  );
                },
                child: CustomText(
                  text: 'Order Now',
                  style: TextStyleManager.textStyle18w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> init() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }
}
