import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';
import 'package:swift_mart/features/home/presentation/managers/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/details_view_body.dart';
import 'package:swift_mart/features/reviews/data/repos/review_repo_impl.dart';
import 'package:swift_mart/features/reviews/presentation/managers/fetch_reviews_average_cubit/fetch_reviews_average_cubit.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddToCartCubit(
            homeRepoImpl: HomeRepoImpl(),
          ),
        ),

        BlocProvider(
          create: (context) => AddToCartCubit(
            homeRepoImpl: HomeRepoImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => FetchReviewsAverageCubit(
            reviewRepoImpl: ReviewRepoImpl(),
          )..fetchAverageReviewMethod(
              productId: productModel.id,
            ),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: DetailsViewBody(
            productModel: productModel,
          ),
        ),
      ),
    );
  }
}
