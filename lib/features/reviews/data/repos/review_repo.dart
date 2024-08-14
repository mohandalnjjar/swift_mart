import 'package:dartz/dartz.dart';
import 'package:swift_mart/core/errors/failures.dart';
import 'package:swift_mart/features/reviews/data/models/review_model.dart';

abstract class ReviewRepo {
  Future<Either<Failure, void>> addReview(
      {required ReviewModel revieModel, required String productId});

  Future<Either<Failure, void>> removeUserReview(
      {required ReviewModel revieModel, required String productId});

  Future<Either<Failure, void>> checkUserReview({
    required String productId,
    required String userId,
  });
}
