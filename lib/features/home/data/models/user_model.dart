import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String email;
  final String userId;
  final String profileImage;
  final String phone;
  final String address;

  UserModel({
    required this.phone,
    required this.name,
    required this.email,
    required this.userId,
    required this.profileImage,
    required this.address,
  });

  factory UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      userId: json['userId'],
      profileImage: json['profileImage'],
      phone: json['phone'],
      address: json['address'],
    );
  }
}
