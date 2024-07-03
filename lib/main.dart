import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:swift_mart/core/functions/app_theme_func.dart';
import 'package:swift_mart/core/utils/services/app_router.dart';
import 'package:swift_mart/features/home/presentation/managers/fetc_user_data_cubit/fetch_user_data_cubit.dart';
import 'package:swift_mart/features/theme/data/repos/theme_repo_impl.dart';
import 'package:swift_mart/features/theme/presentation/managers/cubit/theme_cubit.dart';
import 'package:swift_mart/firebase_options.dart';
import 'package:swift_mart/generated/l10n.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: !true,
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
        BlocProvider(
          create: (context) => FetchUserDataCubit()..fetchUserDataMethod(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeCubitState>(
        builder: (context, state) {
          return MaterialApp.router(
            locale: const Locale('ar'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Swift Mart',
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            theme: appThemeData(
              isDark: BlocProvider.of<ThemeCubit>(context).themeMode,
              context: context,
            ),
            builder: DevicePreview.appBuilder,
          );
        },
      ),
    );
  }
}
