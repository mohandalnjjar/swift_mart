import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/reviews/data/models/review_model.dart';
import 'package:swift_mart/features/reviews/presentation/managers/fetch_user_id_cubit/fetch_user_id_cubit.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/custom_ratting_bar.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/remove_review_bloc_button.dart';

class CurrentUserCommentWidget extends StatelessWidget {
  const CurrentUserCommentWidget({
    super.key,
    required this.reviewModel,
    required this.productId,
  });

  final ReviewModel reviewModel;

  final String productId;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchUserIdCubit(),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Review',
            style: AppStyles.styleSemiBold24(context),
          ),
          const SizedBox(
            height: 14,
          ),
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
                            'https://scontent.fcai11-1.fna.fbcdn.net/v/t39.30808-6/402651895_253683977696066_5539001254900437267_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeFc4sotn7g4b5_wioVqlUCvx59zHDOQiBXHn3McM5CIFXHlCW4Vm_0mMfvtk3de6QFbaYQq4VrFQQ3oecRfd6aA&_nc_ohc=ckbgrqHG2ykQ7kNvgFXTKKg&_nc_ht=scontent.fcai11-1.fna&oh=00_AYB_reXgfW2ET9VcLgKT3JBpFAJ-68Uq3VfRxYl_gAyBsQ&oe=66C12EA9',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      state.data['name'],
                      style: AppStyles.styleSemiBold16(context),
                    ),
                    const Spacer(),
                    InkWell(
                      child: const Icon(Icons.more_vert),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return RemoveReviewBlocButton(
                                reviewModel: reviewModel, productId: productId);
                          },
                        );
                      },
                    )
                  ],
                );
              } else {
                return const Text(
                  'errror ya',
                );
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
