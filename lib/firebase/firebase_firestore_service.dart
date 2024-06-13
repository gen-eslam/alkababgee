import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseFireStoreService {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // add data
  static Future<void> addData({
    required String tableName,
    required Map<String, dynamic> data,
  }) async {
    final reference = firestore.collection(tableName);
    await reference.add(data).then((value) => print(value.id));
  }

  static Future<void> updateData({
    required String tableName,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    final reference = firestore.collection(tableName);
    await reference.doc(id).update(data);
  }

  static Future<void> deleteData({
    required String tableName,
    required String id,
  }) async {
    final reference = firestore.collection(tableName);
    await reference.doc(id).delete().whenComplete(() {
      print('deleted successfully');
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  static Future<List<T>> getDocsData<T>({
    required String tableName,
    required T Function(Map<String, dynamic>, [String? id]) fromJson,
  }) async {
    final reference = firestore.collection(tableName);
    final snapshot = await reference.get();
    final documents = snapshot.docs;
    return documents
        .map(
          (e) => fromJson(e.data(), e.id),
        )
        .toList();
  }

  static Future<T?> getOneData<T>({
    required String tableName,
    required String pram,
    required dynamic pramValue,
    required T Function(Map<String, dynamic>, String id) fromJson,
  }) async {
    final reference = firestore.collection(tableName);
    final snapshot = await reference.where(pram, isEqualTo: pramValue).get();
    return fromJson(
      snapshot.docs.first.data(),
      snapshot.docs.first.id,
    );
  }

  static Future<List<T?>> getFilteredData<T>({
    //getdata<VehicleModel>
    required String tableName,
    required String pram, //uid
    required dynamic pramValue, // cache serv
    required T Function(Map<String, dynamic>, [String? id]) fromJson,
  }) async {
    final reference = firestore.collection(tableName);
    final snapshot = await reference.where(pram, isEqualTo: pramValue).get();
    return snapshot.docs
        .map(
          (e) => fromJson(e.data(), e.id),
        )
        .toList();
  }
}
