import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/utils/services/api_keys.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/payment/data/models/paypal_models/amount_model.dart';
import 'package:swift_mart/features/payment/data/models/paypal_models/details_model.dart';
import 'package:swift_mart/features/payment/data/models/paypal_models/order_item_model.dart';
import 'package:swift_mart/features/payment/data/models/paypal_models/orders_list_model.dart';
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
            // BlocProvider.of<PaymentCubit>(context).makePaymentMethod(
            //   paymentIntentInputModel: PaymentIntentInputModel(
            //     amount: '123',
            //     currency: 'usd',
            //     customerId: 'cus_QRFv32bE8WDVWQ',
            //   ),
            // );
            excutePaypalPayment(context);
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

  void excutePaypalPayment(BuildContext context) {
    var getTransactionsData = getTransactions();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.paypalClientIdkey,
          secretKey: ApiKeys.paypalSecritkey,
          transactions: [
            {
              "amount": getTransactionsData.amount.toJson(),
              "description": "Swift mart payment",
              "item_list": getTransactionsData.items.toJson(),
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
          },
          onError: (error) {
            log("onError: $error");
            context.pop();
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

({AmountModel amount, OrdersListModel items}) getTransactions() {
  var amount = AmountModel(
    currency: "USD",
    details: DetailsModel(
      subtotal: '100',
      shipping: '0',
      shippingDiscount: 0,
    ),
    total: '100',
  );
  List<OrderItemsModel> orders = [
    OrderItemsModel(
      currency: 'USD',
      name: 'apple',
      quantity: 1,
      price: '100',
    ),
  ];
  var itemsList = OrdersListModel(ordersList: orders);

  return (
    amount: amount,
    items: itemsList,
  );
}
