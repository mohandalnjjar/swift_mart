import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:swift_mart/core/functions/validators/validators.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/custom_text_form_field.dart';
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
  @override
  Widget build(BuildContext context) {
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
            obscureText: obscureText,
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? IconlyLight.shield_done : IconlyLight.shield_fail,
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
                style: AppStyles.styleGreyReg16(context),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                FocusScope.of(context).unfocus();
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
                onTap: () {},
              ),
              const SizedBox(
                width: 40,
              ),
              LoginSocialMeadiWidget(
                image: 'assets/images/facebook.png',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
