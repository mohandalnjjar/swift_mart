import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/functions/validators/validators.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/custom_loading_indicator.dart';
import 'package:swift_mart/core/utils/widgets/custom_text_form_field.dart';
import 'package:swift_mart/features/reviews/data/models/review_model.dart';
import 'package:swift_mart/features/reviews/data/models/review_view_data_model.dart';
import 'package:swift_mart/features/reviews/presentation/managers/add_review_cubit/add_review_cubit.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/custom_start_ratting.dart';

class AddRattingReviewBody extends StatefulWidget {
  const AddRattingReviewBody({
    super.key,
    required this.reviewViewDataModel,
  });
  final ReviewViewDataModel reviewViewDataModel;

  @override
  State<AddRattingReviewBody> createState() => _AddRattingReviewBodyState();
}

class _AddRattingReviewBodyState extends State<AddRattingReviewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  double? starCount;
  String? comment;
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    return BlocListener<AddReviewCubit, AddReviewCubitState>(
      listener: (context, state) {
        if (state is AddReviewLoading) {
          const CustomLoadingIndicator(
            inAsyncCall: true,
          );
        } else if (state is AddReviewSuccess) {
          GoRouter.of(context).pop();
        } else if (state is AddReviewFailed) {
          showedScaffoldMessage(
            context: context,
            message: state.errorMeassage,
          );
        }
      },
      child: CustomScrollView(
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
                'Review',
                style: AppStyles.styleSemiBold27(context),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(13),
            sliver: SliverToBoxAdapter(
              child: Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .30,
                      child: CachedNetworkImage(
                          imageUrl: widget.reviewViewDataModel.image),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CustomRatingBar(
                            initialRating: 0,
                            onRatingChanged: (value) {
                              starCount = value;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Write a Review for us!',
                            style: AppStyles.styleSemiBold19(context),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    CustomTextFromField(
                      hint: 'Write your Review',
                      validator: (value) {
                        return Validators.descriptionValidator(value);
                      },
                      maxLines: 8,
                      onSaved: (value) {
                        comment = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (starCount == null) {
                      showedScaffoldMessage(
                        context: context,
                        message: 'Please select a star rating.',
                      );
                    }
                    formKey.currentState!.save();
                    FocusScope.of(context).unfocus();

                    BlocProvider.of<AddReviewCubit>(context).addReviewMethod(
                      revieModel: ReviewModel(
                        userId: user!.uid,
                        comment: comment!,
                        rating: starCount!,
                        timestamp: Timestamp.now(),
                      ),
                      productId: widget.reviewViewDataModel.productId,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                child: Text(
                  'Submit',
                  style: AppStyles.styleRegular18(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
