import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

Future<String> uploadImage(String userId, String filePath) async {
  final ref =
      FirebaseStorage.instance.ref().child('UsersImages').child('$userId/.jpg');

  await ref.putFile(
    File(filePath),
  );
  return await ref.getDownloadURL();
}
