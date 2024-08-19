import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addUserDetailsFistTime(
    {required String name, required String email}) async {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? user = auth.currentUser;
  final uid = user!.uid;

  await FirebaseFirestore.instance.collection('users').doc(uid).set(
    {
      'userId': uid,
      'name': name,
      'profileImage':
          'https://firebasestorage.googleapis.com/v0/b/swift-mart-9e189.appspot.com/o/unknown_user.png?alt=media&token=7bd2a2fa-7807-4b31-afd7-e179e4151e0a',
      'phone': '',
      'email': email,
      'userCart': [],
      'userWish': [],
      'createdAt': Timestamp.now(),
    },
  );
}
