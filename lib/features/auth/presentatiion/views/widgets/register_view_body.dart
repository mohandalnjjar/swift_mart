import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/register_form.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: RegisterForm(),
        ),
      ),
    );
  }
}
