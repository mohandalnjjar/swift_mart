import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swift_mart/features/auth/presentatiion/views/login_view.dart';
import 'package:swift_mart/page_view_views.dart';

class CheckAuth extends StatelessWidget {
  const CheckAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const PageViewViews();
        } else {
          return const LoginView();
        }
      },
    );
  }
}
