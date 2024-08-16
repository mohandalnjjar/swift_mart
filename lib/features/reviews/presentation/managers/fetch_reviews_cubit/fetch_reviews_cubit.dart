import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/reviews/data/models/review_model.dart';

part 'fetch_reviews_state.dart';

class FetchReviewsCubit extends Cubit<FetchReviewsState> {
  FetchReviewsCubit() : super(FetchReviewsInitial());

  Future<void> fetchReviews({required productId}) async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .snapshots()
        .listen(
      (DocumentSnapshot<Map<String, dynamic>> data) {
        var userWish = data.get('reviews') as List<dynamic>;

        List<ReviewModel> reviews = userWish.map(
          (data) {
            return ReviewModel.fromJson(data as Map<String, dynamic>);
          },
        ).toList();

        int index = reviews.indexWhere((review) => review.userId == user!.uid);
        if (index != -1) {
          ReviewModel userReview = reviews.removeAt(index);
          reviews.insert(0, userReview);
        }

        emit(
          FetchReviewsSuccess(
            reviews: reviews,
          ),
        );
      },
      onError: (error) {
        emit(
          FetchReviewsFailed(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }
}
