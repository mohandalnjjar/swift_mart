import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
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
              context
                  .read<FetchUserIdCubit>()
                  .fetchUserId(userId: reviewModel.userId);

              if (state is FetchUserIdSuccess) {
                return Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        height: 45,
                        imageUrl:
                            'https://scontent.fcai11-1.fna.fbcdn.net/v/t39.30808-6/429897266_315090971555366_5332440714602139373_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeFVBWgUOO3APzZ5b6a0YeEQJhbzQZsUVUImFvNBmxRVQg1xpVzPIdrbJ-pZ_Z0uIYHITxWBzT2FpT3vMyIIXzk2&_nc_ohc=qoBREBUrLSAQ7kNvgHT4zHD&_nc_ht=scontent.fcai11-1.fna&oh=00_AYBRS9pwkz1aQTxqVO8V7Efk1gxtWNdt2i5y8yd-N_JM5A&oe=66C05BA3',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      state.data['name'],
                      style: AppStyles.styleSemiBold16(context),
                    )
                  ],
                );
              } else {
                return const Text(
                    'errror yaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa333 man hhh');
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