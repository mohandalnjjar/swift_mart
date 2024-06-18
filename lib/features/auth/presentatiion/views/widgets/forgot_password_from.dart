import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/core/functions/validators/validators.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/custom_text_form_field.dart';
import 'package:swift_mart/features/auth/presentatiion/managers/reset_password_cubit/rest_password_cubit.dart';

class ForGotPasswordFrom extends StatefulWidget {
  const ForGotPasswordFrom({
    super.key,
  });

  @override
  State<ForGotPasswordFrom> createState() => _ForGotPasswordFromState();
}

class _ForGotPasswordFromState extends State<ForGotPasswordFrom> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  String? email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Enter your email',
            style: AppStyles.styleSemiBold30(context),
          ),
          Text(
            'we will send a reset link',
            style: AppStyles.styleSemiBold30(context),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFromField(
            onSaved: (value) {
              email = value;
            },
            hint: 'Email',
            validator: (value) {
              return Validators.emailValidator(value);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                FocusScope.of(context).unfocus();
                BlocProvider.of<RestPasswordCubit>(context)
                    .resetPasswordMethod(email: email);
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
            child: Text(
              'Reset Password',
              style: AppStyles.style700w16(context),
            ),
          ),
        ],
      ),
    );
  }
}
