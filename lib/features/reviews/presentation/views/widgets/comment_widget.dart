import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/reviews/data/models/ratting_model.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/custom_ratting_bar.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.rattingModel,
  });

  final RattingModel rattingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                height: 45,
                imageUrl: rattingModel.image,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              rattingModel.name,
              style: AppStyles.styleSemiBold16(context),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            RatingBar(rating: rattingModel.ratting),
            const SizedBox(
              width: 10,
            ),
            Text(rattingModel.date),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ReadMoreText(
                rattingModel.comment,
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
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.kWhitePrimaryColor,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Swift Mart Store',
                    style: AppStyles.styleRegular15(context),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(rattingModel.date),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ReadMoreText(
                rattingModel.comment,
                trimMode: TrimMode.Line,
                trimLines: 3,
                colorClickableText: Theme.of(context).colorScheme.primary,
                trimCollapsedText: ' Show more',
                trimExpandedText: ' Show less',
                moreStyle: AppStyles.styleSemiBold14(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
