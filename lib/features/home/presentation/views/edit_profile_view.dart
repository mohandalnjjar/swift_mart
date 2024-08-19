import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';
import 'package:swift_mart/features/home/presentation/managers/uploa_use_details_cubit/upload_user_details_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/upload_user_image_cubit/upload_user_image_cubit.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/eidt_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UploadUserImageCubit(
            homeRepoImpl: HomeRepoImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => UploadUserDetailsCubit(
            homeRepoImpl: HomeRepoImpl(),
          ),
        ),
      ],
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: EditProfileViewBody(),
        ),
      ),
    );
  }
}
