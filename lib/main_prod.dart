import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:swift_mart/app.dart';
import 'package:swift_mart/core/utils/services/api_keys.dart';
import 'package:swift_mart/firebase_options_prod.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Stripe.publishableKey = ApiKeys.publishablekey;
  runApp(
    const SwiftMart(),
  );
}
