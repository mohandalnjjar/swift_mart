import 'package:flutter/material.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/register_form.dart';

class MobileRegisterViewLayotu extends StatelessWidget {
  const MobileRegisterViewLayotu({
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
