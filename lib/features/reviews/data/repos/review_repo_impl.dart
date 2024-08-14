import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:swift_mart/core/errors/failures.dart';
import 'package:swift_mart/features/reviews/data/models/review_model.dart';
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
}
