import 'package:flutter/material.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/forgot_password_from.dart';

class MobileForgotPassswordBody extends StatelessWidget {
  const MobileForgotPassswordBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ForGotPasswordFrom(),
      ),
    );
  }
}
