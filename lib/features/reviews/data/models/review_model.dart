import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  final String userId;
  final String comment;
  final double rating;
  final Timestamp timestamp;

  ReviewModel({
    required this.userId,
    required this.comment,
    required this.rating,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'comment': comment,
        'rating': rating,
        'timestamp': timestamp,
      };

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        userId: json['userId'],
        comment: json['comment'],
        rating: json['rating'],
        timestamp: json['timestamp'],
      );
}
