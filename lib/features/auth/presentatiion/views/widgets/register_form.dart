import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/functions/validators/validators.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/custom_text_form_field.dart';
import 'package:swift_mart/features/auth/presentatiion/managers/cubit/google_login_cubit.dart';
import 'package:swift_mart/features/auth/presentatiion/managers/signup/sign_up_cubit.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/login_with_social_media_widget.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/or_widget.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool obscureText = true;
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleLoginCubit, GoogleLoginState>(
      listener: (context, state) {
        if (state is GoogleLoginLoading) {
          showDialog(
            context: context,
            builder: (context) => const AbsorbPointer(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state is GoogleLoginFailed) {
          context.pop();

          showedScaffoldMessage(context: context, message: state.errorMessage);
        } else {
          context.pop();
          GoRouter.of(context).push(AppConstance.kCheckAuthState);

          showedScaffoldMessage(context: context, message: 'Done');
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Sign up to continue',
                style: AppStyles.styleSemiBold30(context),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Please enter your detials',
                style: AppStyles.styleGreyReg16(context),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFromField(
                hint: 'UserName',
                validator: (value) {
                  return Validators.nameValidator(value);
                },
                prefixIcon: const Icon(IconlyLight.user),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFromField(
                onSaved: (value) {
                  email = value;
                },
                validator: (value) {
                  return Validators.emailValidator(value);
                },
                hint: 'Email',
                prefixIcon: const Icon(IconlyLight.message),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFromField(
                onSaved: (value) {
                  password = value;
                },
                obscureText: obscureText,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureText
                        ? IconlyLight.shield_done
                        : IconlyLight.shield_fail,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
                hint: 'Password',
                validator: (value) {
                  return Validators.passwordValidator(value);
                },
                prefixIcon: const Icon(IconlyLight.password),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    FocusScope.of(context).unfocus();
                    await BlocProvider.of<SignUpCubit>(context)
                        .signUpMethod(email: email!, password: password!);
                    if (context.mounted) {
                      GoRouter.of(context)
                          .pushReplacement(AppConstance.kCheckAuthState);
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                child: Text(
                  'Sing Up',
                  style: AppStyles.style700w16(context),
                ),
              ),
              const OrWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginSocialMeadiWidget(
                    image: 'assets/images/google_icons.png',
                    onTap: () async {
                      await BlocProvider.of<GoogleLoginCubit>(context)
                          .googleAuthMethod();
                    },
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  LoginSocialMeadiWidget(
                    image: 'assets/images/apple.png',
                    onTap: () async {},
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
