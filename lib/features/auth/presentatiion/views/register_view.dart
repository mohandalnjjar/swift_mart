import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Register'),
        centerTitle: true,
        leading: Center(
          child: IconButton(
            style: IconButton.styleFrom(
              side: const BorderSide(color: Colors.grey, width: 1),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Ionicons.arrow_back,
              size: 27,
            ),
          ),
        ),
      ),
      body: const SafeArea(
        child: RegisterViewBody(),
      ),
    );
  }
}
