import 'package:dartz/dartz.dart';
import 'package:swift_mart/core/errors/failures.dart';
import 'package:swift_mart/features/reviews/data/models/review_model.dart';

abstract class ReviewRepo {
  Future<Either<Failure, void>> addRatting(
      {required ReviewModel revieModel, required String productId});
}
