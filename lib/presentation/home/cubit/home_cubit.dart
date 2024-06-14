import 'package:alkababgee/firebase/firebase_firestore_service.dart';
import 'package:alkababgee/firebase/tables_name.dart';
import 'package:alkababgee/model/food/food_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  Set<String> category = {
    "All",
  };

  int currentIndex = 0;

  List<FoodModel> foodData = [];

  Map<String, List<FoodModel>> foodMap = {};

  void getData() async {
    emit(GetDataLoading());
    try {
      foodData = await FirebaseFireStoreService.getDocsData<FoodModel>(
        tableName: TablesName.food,
        fromJson: FoodModel.fromJson,
      );

      category.addAll(
        foodData.map((e) => e.category).toSet(),
      );
      initMap();
      emit(GetDataSuccess());
    } catch (e) {
      emit(GetDataError(e.toString()));
    }
  }

  void initMap() {
    for (int i = 1; i < category.length; i++) {
      foodMap[category.elementAt(i)] = foodData
          .where(
            (element) => element.category == category.elementAt(i),
          )
          .toList();
    }
    foodMap["All"] = foodData;
  }

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndex());
  }
}
