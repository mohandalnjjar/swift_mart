import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addUserDetails(
    {required String name, required String email}) async {
  final auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  final uid = user!.uid;

  await FirebaseFirestore.instance.collection('users').doc(uid).set(
    {
      'userId': uid,
      'name': name,
      'email': email,
      'userCart': [],
      'userWish': [],
      'createdAt': Timestamp.now(),
    },
  );
}
