import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

abstract class FirebaseStorageService {
  static final storageRef = FirebaseStorage.instance;

  static Future<String> uploadImage({
    required File image,
  }) async {
    var ref = FirebaseStorage.instance.ref().child("images/${DateTime.now()}");
    var uploadTask = ref.putFile(image);
    var storageTaskSnapshot = await uploadTask.whenComplete(() => null);
    var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  }
}
