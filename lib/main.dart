import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/core/functions/app_theme_func.dart';
import 'package:swift_mart/core/utils/services/app_router.dart';
import 'package:swift_mart/features/theme/data/repos/theme_repo_impl.dart';
import 'package:swift_mart/features/theme/presentation/managers/cubit/theme_cubit.dart';
import 'package:swift_mart/firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const SwiftMart(),
    ),
  );
}

class SwiftMart extends StatelessWidget {
  const SwiftMart({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(
            ThemeRepoImpl(),
          )..getTheme(context: context),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeCubitState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Swift Mart',
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            theme: appThemeData(
              isDark: false,
              context: context,
            ),
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
          );
        },
      ),
    );
  }
}
