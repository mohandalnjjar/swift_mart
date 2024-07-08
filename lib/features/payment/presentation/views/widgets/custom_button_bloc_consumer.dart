import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/payment/data/models/payment_models/payment_intent_input_model.dart';
import 'package:swift_mart/features/payment/presentation/managers/payment_cubit/payment_cubit.dart';
import 'package:swift_mart/generated/l10n.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          context.pop();
        }

        if (state is PaymentFailure) {
          context.pop();
          showedScaffoldMessage(
              context: context, message: state.faiulreMessage);
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            BlocProvider.of<PaymentCubit>(context).makePaymentMethod(
              paymentIntentInputModel:
                  PaymentIntentInputModel(amount: '100', currency: 'usd'),
            );
          },
          child: state is PaymentLoading
              ? const CircularProgressIndicator()
              : Text(
                  S.of(context).Checkout,
                  style: AppStyles.style700w16(context),
                ),
        );
      },
    );
  }
}
