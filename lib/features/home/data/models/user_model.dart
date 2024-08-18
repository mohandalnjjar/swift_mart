import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String email;
  final String userId;
  final String? profileImage;

  UserModel({
    required this.name,
    required this.email,
    required this.userId,
    required this.profileImage,
  });

  factory UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      userId: json['userId'],
      profileImage: json['profileImage'],
    );
  }
}




