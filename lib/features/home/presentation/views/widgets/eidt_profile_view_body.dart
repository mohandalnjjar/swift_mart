import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/simple_shimmer_loading_indicator.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_user_data_cubit/fetch_user_data_cubit.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/edit_profile_text_form_filed.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/upload_user_image_bloc_button.dart';
import 'package:swift_mart/generated/l10n.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchUserDataCubit, FetchUserDataState>(
      builder: (context, state) {
        if (state is FetchUserDataSuccess) {
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
                    S.of(context).EditProfile,
                    style: AppStyles.styleSemiBold30(context),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.27,
                  child: Column(
                    children: [
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: state.userModel.profileImage!,
                              errorWidget: (context, url, error) => Image.asset(
                                Assets.imagesAppIcon,
                              ),
                              placeholder: (context, url) =>
                                  const SimpleShimmerLoadingIndicator(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        state.userModel.name,
                        style: AppStyles.styleRegular24(context),
                      ),
                      const SizedBox(height: 7),
                      UploadUserImageSection(),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: EditProfileTextFormFileds(),
              )
            ],
          );
        } else {
          return const Text('dd');
        }
      },
    );
  }
}
