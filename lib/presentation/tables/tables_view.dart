import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:alkababgee/firebase/firebase_firestore_service.dart';
import 'package:alkababgee/firebase/tables_name.dart';
import 'package:alkababgee/model/table/table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TablesView extends StatefulWidget {
  const TablesView({super.key});

  @override
  State<TablesView> createState() => _TablesViewState();
}

class _TablesViewState extends State<TablesView> {
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
          text: "Tables",
          style: TextStyleManager.textStyle18w600,
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFireStoreService.getDocsData<TableModel>(
            tableName: TablesName.table, fromJson: TableModel.fromJson),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            snapshot.data!.sort((a, b) => a.status.compareTo(b.status));
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: AlignmentDirectional.topStart,
                  margin: EdgeInsets.all(10.r),
                  width: context.deviceWidth,
                  decoration: BoxDecoration(
                    color: ColorsManager.deepRed,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: ListTile(
                    onTap: () {
                      
                    },
                    leading: const Icon(
                      Icons.table_bar,
                      color: ColorsManager.white,
                    ),
                    title: CustomText(
                      textAlign: TextAlign.start,
                      text: snapshot.data![index].name,
                      style: TextStyleManager.textStyle18w400,
                    ),
                    subtitle: CustomText(
                      textAlign: TextAlign.start,
                      text: 'seets: ${snapshot.data![index].capacity}',
                      style: TextStyleManager.textStyle18w400,
                    ),
                    trailing: CustomText(
                      textAlign: TextAlign.start,
                      text: snapshot.data![index].status,
                      style: TextStyleManager.textStyle18w400,
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
