import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/custom_loading_indicator.dart';
import 'package:swift_mart/features/home/presentation/managers/upload_user_image_cubit/upload_user_image_cubit.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/upload_pictures_how_modal_bottom_sheet.dart';
import 'package:swift_mart/generated/l10n.dart';

class UploadUserImageSection extends StatelessWidget {
  const UploadUserImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadUserImageCubit, UploadUserImageState>(
      listener: (context, state) {
        if (state is UploadUserImageLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => CustomLoadingIndicator(
              inAsyncCall: true,
            ),
          );
        } else if (state is UploadUserImageSuccess ||
            state is UploadUserImageFailed) {
          if (Navigator.of(context, rootNavigator: true).canPop()) {
            Navigator.of(context, rootNavigator: true).pop();
          }

          if (state is UploadUserImageFailed) {
            // Show error message
            showedScaffoldMessage(
              context: context,
              message: state.errorMessage,
            );
          }
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            uploadPictureShowModalBottomSheet(
              context: context,
              onTapCamera: () {
                BlocProvider.of<UploadUserImageCubit>(context)
                    .uploadUserimage(source: ImageSource.camera);
              },
              onTapGallery: () {
                BlocProvider.of<UploadUserImageCubit>(context)
                    .uploadUserimage(source: ImageSource.gallery);
              },
            );
          },
          child: Text(
            S.of(context).ChangeImage,
            style: AppStyles.styleGreyReg16(context),
          ),
        );
      },
    );
  }
}
