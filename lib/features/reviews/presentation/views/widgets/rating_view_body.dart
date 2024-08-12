import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/custom_cart_button.dart';
import 'package:swift_mart/features/reviews/data/models/ratting_model.dart';
import 'package:swift_mart/features/reviews/data/models/review_view_data_model.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/comment_widget.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/ratting_indicators_widget.dart';

class RatingViewBody extends StatelessWidget {
  const RatingViewBody({
    super.key,
    required this.reviewViewDataModel,
  });
  final ReviewViewDataModel reviewViewDataModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          sliver: SliverAppBar(
            leading: GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
            centerTitle: true,
            title: Text(
              'Rattings',
              style: AppStyles.styleSemiBold30(context),
            ),
            actions: [
              CustomButton(
                icon: const Icon(
                  Ionicons.add,
                  color: Colors.white,
                ),
                onTap: () => GoRouter.of(context).push(
                  RouterPath.kAddRattingReview,
                  extra: ReviewViewDataModel(
                    image: reviewViewDataModel.image,
                    productId: reviewViewDataModel.productId,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          sliver: SliverToBoxAdapter(
            child: RattingIndicatorsWidget(),
          ),
        ),
        SliverList.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 8,
            ),
            child: CommentWidget(
              rattingModel: RattingModel(
                  name: 'Muahned basha',
                  date: '14 Aug 2024',
                  comment:
                      'The iPhone 15 is a game-changer! The sleek design, enhanced camera capabilities, and improved battery life make it a top contender in the smartphone market. The new A17 chip ensures lightning-fast performance, while the vibrant display provides stunning visuals. Apple continues to impress with innovation, and the iPhone 15 is no exception. Highly recommended for anyone looking for a powerful, stylish, and reliable device.',
                  replay: '',
                  image:
                      'https://scontent.fcai11-1.fna.fbcdn.net/v/t39.30808-6/452937264_408667445531051_3172662048493596054_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeGZCquyo4rODM-5J81IlElBbyd2LB5HtspvJ3YsHke2yn1Dkn9cCbZaxCLyC0kNiJxVit1FOCWK7T6TyUrQNvOL&_nc_ohc=BulQWQTg9-oQ7kNvgH19H11&_nc_ht=scontent.fcai11-1.fna&oh=00_AYCre_24gVuBO4zJjcn6qrdLMx-K5vC3qIOrbbft3OFGnw&oe=66BBD40A',
                  ratting: 20.4),
            ),
          ),
        ),
      ],
    );
  }
}
