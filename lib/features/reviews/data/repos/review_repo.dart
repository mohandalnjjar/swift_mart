import 'package:dartz/dartz.dart';
import 'package:swift_mart/core/errors/failures.dart';
import 'package:swift_mart/features/reviews/data/models/review_model.dart';
import 'package:swift_mart/features/reviews/data/models/star_rating_counts_model.dart';

abstract class ReviewRepo {
  Future<Either<Failure, void>> addReview(
      {required ReviewModel revieModel, required String productId});

  Future<Either<Failure, void>> removeUserReview(
      {required ReviewModel revieModel, required String productId});

  Future<Either<Failure, void>> checkUserReview({
    required String productId,
    required String userId,
  });

  Stream<Either<Failure, double>> fetchReviewAverage(
      {required String productId});

  Stream<Either<Failure, StarRatingCounts>> countProductStars(
      {required String productId});
}
