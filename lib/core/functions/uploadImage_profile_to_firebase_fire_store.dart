import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateUserProfileImage(String userId, String imageUrl) async {
  await FirebaseFirestore.instance.collection('users').doc(userId).update(
    {
      'profileImage': imageUrl,
    },
  );
}
