import 'package:alkababgee/core/constant/keys.dart';
import 'package:alkababgee/core/services/cache_service.dart';
import 'package:alkababgee/firebase/firebase_firestore_service.dart';
import 'package:alkababgee/firebase/tables_name.dart';
import 'package:alkababgee/model/auth/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'booking_table_state.dart';

class BookingTableCubit extends Cubit<BookingTableState> {
  BookingTableCubit() : super(BookingTableInitial());
  static BookingTableCubit get(context) =>
      BlocProvider.of<BookingTableCubit>(context);

  UserModel? userModel = UserModel();

  DateTime? date = DateTime.now().add(
    const Duration(hours: 1),
  );

  void getUser() async {
    emit(BookingTableGetUserLoadingState());
    try {
      userModel = await FirebaseFireStoreService.getOneData<UserModel>(
        tableName: TablesName.users,
        pram: 'uid',
        pramValue: CacheService.getDataString(
          key: Keys.userId,
        ),
        fromJson: UserModel.fromJson,
      );
      emit(BookingTableGetUserSuccessState());
    } catch (e) {
      emit(BookingTableGetUserErrorState());
    }
  }

  String getDateOnly() {
    return DateFormat.yMEd().format(date!);
  }

  String getTimeOnly() {
    return DateFormat().add_jm().format(date!);
  }
}
