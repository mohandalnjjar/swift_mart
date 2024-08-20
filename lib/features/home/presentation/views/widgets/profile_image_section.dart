import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/simple_shimmer_loading_indicator.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_user_data_cubit/fetch_user_data_cubit.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchUserDataCubit, FetchUserDataState>(
      builder: (context, state) {
        if (state is FetchUserDataSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.25,
            child: Column(
              children: [
                Expanded(
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
                const SizedBox(height: 10),
                Text(
                  state.userModel.name,
                  style: AppStyles.styleRegular24(context),
                ),
                const SizedBox(height: 7),
                Text(
                  state.userModel.email,
                  style: AppStyles.styleGreyReg16(context),
                )
              ],
            ),
          );
        } else {
          return Text('ERRROOR');
        }
      },
    );
  }
}
