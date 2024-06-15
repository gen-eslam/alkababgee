part of 'booking_table_cubit.dart';

abstract class BookingTableState {}

final class BookingTableInitial extends BookingTableState {}

//BookingTableGetUserLoadingState
final class BookingTableGetUserLoadingState extends BookingTableState {}

//BookingTableGetUserSuccessState
final class BookingTableGetUserSuccessState extends BookingTableState {}

//BookingTableGetUserERRORState
final class BookingTableGetUserErrorState extends BookingTableState {}

//changeDate
final class ChangeDateState extends BookingTableState {}
