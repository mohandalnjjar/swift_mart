import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/functions/validators/validators.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/custom_text_form_field.dart';
import 'package:swift_mart/features/auth/presentatiion/managers/google_login_cubit/google_login_cubit.dart';
import 'package:swift_mart/features/auth/presentatiion/managers/login_cubit/login_cubit.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/login_with_social_media_widget.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/or_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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

          showedScaffoldMessage(context: context, message: 'Done');
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcom back !',
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
                onSaved: (value) {
                  email = value;
                },
                hint: 'Email',
                validator: (value) {
                  return Validators.emailValidator(value);
                },
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
                prefixIcon: const Icon(IconlyLight.password),
                validator: (value) {
                  return Validators.passwordValidator(value);
                },
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () async {
                    await GoRouter.of(context)
                        .push(AppConstance.kForgotPasswordView);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: AppStyles.styleRegular15(context)
                        .copyWith(color: Colors.grey),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    FocusScope.of(context).unfocus();
                    await BlocProvider.of<LoginCubit>(context).loginMethod(
                      email: email!,
                      password: password!,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                child: Text(
                  'Login',
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
                    image: 'assets/images/facebook.png',
                    onTap: () async {
                      await signInWithFacebook();
                    },
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

Future<void> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // Once signed in, return the UserCredential
  await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
