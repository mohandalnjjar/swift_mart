import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/simple_shimmer_loading_indicator.dart';
import 'package:swift_mart/features/reviews/data/models/review_model.dart';
import 'package:swift_mart/features/reviews/presentation/managers/fetch_user_id_cubit/fetch_user_id_cubit.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/custom_ratting_bar.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.reviewModel,
  });

  final ReviewModel reviewModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchUserIdCubit(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<FetchUserIdCubit, FetchUserIdState>(
            builder: (context, state) {
              if (state is FetchUserIdInitial) {
                context
                    .read<FetchUserIdCubit>()
                    .fetchUserId(userId: reviewModel.userId);
              }
              if (state is FetchUserIdSuccess) {
                return Row(
                  children: [
                    SizedBox(
                      height: 50,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: state.userModel.profileImage,
                            errorWidget: (context, url, error) => Image.asset(
                              Assets.imagesAppIcon,
                            ),
                            placeholder: (context, url) =>
                                const SimpleShimmerLoadingIndicator(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      state.userModel.name,
                      style: AppStyles.styleSemiBold16(context),
                    )
                  ],
                );
              } else {
                return const Text('Failed to load user data');
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              RatingBar(rating: reviewModel.rating),
              const SizedBox(
                width: 10,
              ),
              Text(
                DateFormat('d MMM yyyy').format(
                  reviewModel.timestamp.toDate(),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ReadMoreText(
                  reviewModel.comment,
                  trimMode: TrimMode.Line,
                  trimLines: 3,
                  colorClickableText: Colors.grey,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Show less',
                  moreStyle: AppStyles.styleSemiBold14(context),
                ), ////
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
