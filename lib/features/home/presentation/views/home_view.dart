import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/home/presentation/managers/fetc_user_data_cubit/fetch_user_data_cubit.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchUserDataCubit()..fetchUserDataMethod(),
      child: const Scaffold(
        body: SafeArea(
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
