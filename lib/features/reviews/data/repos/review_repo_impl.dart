import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:swift_mart/core/errors/failures.dart';
import 'package:swift_mart/features/reviews/data/models/review_model.dart';
import 'package:swift_mart/features/reviews/data/models/star_rating_counts_model.dart';
import 'package:swift_mart/features/reviews/data/repos/review_repo.dart';

class ReviewRepoImpl extends ReviewRepo {
  @override
  Future<Either<Failure, void>> addReview(
      {required ReviewModel revieModel, required String productId}) async {
    try {
      final reviewRef =
          FirebaseFirestore.instance.collection('products').doc(productId);

      await reviewRef.update(
        {
          'reviews': FieldValue.arrayUnion(
            [
              revieModel.toJson(),
            ],
          )
        },
      );

      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> removeUserReview(
      {required ReviewModel revieModel, required String productId}) async {
    try {
      final reviewRef =
          FirebaseFirestore.instance.collection('products').doc(productId);

      await reviewRef.update(
        {
          'reviews': FieldValue.arrayRemove(
            [
              revieModel.toJson(),
            ],
          )
        },
      );

      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> checkUserReview({
    required String productId,
    required String userId,
  }) async {
    try {
      DocumentSnapshot data = await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .get();

      var userReview = data.get('reviews') as List<dynamic>;

      bool userHasReviewed = userReview.any(
        (review) {
          return review['userId'] == userId;
        },
      );

      if (userHasReviewed) {
        return right(true);
      } else {
        return right(false);
      }
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Stream<Either<Failure, double>> fetchReviewAverage(
      {required String productId}) async* {
    try {
      await for (DocumentSnapshot data in FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .snapshots()) {
        var userReviews = data.get('reviews') as List<dynamic>?;
        double totalRating = 0.0;

        if (userReviews != null && userReviews.isNotEmpty) {
          for (var rating in userReviews) {
            totalRating += rating['rating'];
          }

          double averageRating = totalRating / userReviews.length;
          double truncatedAverage =
              (averageRating * 10).truncateToDouble() / 10;
          await FirebaseFirestore.instance
              .collection('products')
              .doc(productId)
              .update(
            {
              'rate': truncatedAverage,
            },
          );

          yield right(truncatedAverage);
        } else {
          yield right(0.0);
        }
      }
    } catch (e) {
      yield left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Stream<Either<Failure, StarRatingCounts>> countProductStars(
      {required String productId}) async* {
    try {
      await for (DocumentSnapshot data in FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .snapshots()) {
        var reviews = data.get('reviews') as List<dynamic>?;

        if (reviews != null && reviews.isNotEmpty) {
          StarRatingCounts starRatingCounts =
              StarRatingCounts.fromReviews(reviews);
          yield right(starRatingCounts);
        } else {
          yield right(
            StarRatingCounts(
                fiveStars: 0.0,
                fourStars: 0.0,
                threeStars: 0.0,
                twoStars: 0.0,
                oneStar: 0.0),
          );
        }
      }
    } catch (e) {
      yield left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
