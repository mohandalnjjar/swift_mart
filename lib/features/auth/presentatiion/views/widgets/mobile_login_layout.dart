import 'package:flutter/material.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/login_form.dart';

class MobileLoginLayout extends StatelessWidget {
  const MobileLoginLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          child: LoginForm(),
        ),
      ),
    );
  }
}
