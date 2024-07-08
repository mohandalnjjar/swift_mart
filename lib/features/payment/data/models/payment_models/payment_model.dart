import 'package:swift_mart/features/payment/data/models/payment_models/Amount_details_model.dart';
import 'package:swift_mart/features/payment/data/models/payment_models/amount_payment_methods.dart';
import 'package:swift_mart/features/payment/data/models/payment_models/paymentMethodOptions.dart';

class PaymentModel {
  final String id;
  final String object;
  final int amount;
  final int amountCapturable;
  final AmountDetailsModel amountDetails;
  final int amountReceived;
  final dynamic application;
  final dynamic applicationFeeAmount;
  final AutomaticPaymentMethodsModel automaticPaymentMethods;
  final dynamic canceledAt;
  final dynamic cancellationReason;
  final String captureMethod;
  final String clientSecret;
  final String confirmationMethod;
  final int created;
  final String currency;
  final dynamic customer;
  final dynamic description;
  final dynamic invoice;
  final dynamic lastPaymentError;
  final dynamic latestCharge;
  final bool livemode;
  final Map<String, dynamic> metadata;
  final dynamic nextAction;
  final dynamic onBehalfOf;
  final dynamic paymentMethod;
  final Paymentmethodoptions paymentMethodOptions;
  final List<dynamic> paymentMethodTypes;
  final dynamic processing;
  final dynamic receiptEmail;
  final dynamic review;
  final dynamic setupFutureUsage;
  final dynamic shipping;
  final dynamic source;
  final dynamic statementDescriptor;
  final dynamic statementDescriptorSuffix;
  final String status;
  final dynamic transferData;
  final dynamic transferGroup;

  PaymentModel({
    required this.amountDetails,
    required this.id,
    required this.object,
    required this.amount,
    required this.amountCapturable,
    required this.amountReceived,
    required this.application,
    required this.applicationFeeAmount,
    required this.automaticPaymentMethods,
    required this.canceledAt,
    required this.cancellationReason,
    required this.captureMethod,
    required this.clientSecret,
    required this.confirmationMethod,
    required this.created,
    required this.currency,
    required this.customer,
    required this.description,
    required this.invoice,
    required this.lastPaymentError,
    required this.latestCharge,
    required this.livemode,
    required this.metadata,
    required this.nextAction,
    required this.onBehalfOf,
    required this.paymentMethod,
    required this.paymentMethodOptions,
    required this.paymentMethodTypes,
    required this.processing,
    required this.receiptEmail,
    required this.review,
    required this.setupFutureUsage,
    required this.shipping,
    required this.source,
    required this.statementDescriptor,
    required this.statementDescriptorSuffix,
    required this.status,
    required this.transferData,
    required this.transferGroup,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> jsonData) {
    return PaymentModel(
      id: jsonData['id'],
      object: jsonData['object'],
      amount: jsonData['amount'],
      amountCapturable: jsonData['amount_capturable'],
      amountReceived: jsonData['amount_received'],
      application: jsonData['application'],
      applicationFeeAmount: jsonData['application_fee_amount'],
      canceledAt: jsonData['canceled_at'],
      cancellationReason: jsonData['cancellation_reason'],
      captureMethod: jsonData['capture_method'],
      clientSecret: jsonData['client_secret'],
      confirmationMethod: jsonData['confirmation_method'],
      created: jsonData['created'],
      currency: jsonData['currency'],
      customer: jsonData['customer'],
      description: jsonData['description'],
      invoice: jsonData['invoice'],
      lastPaymentError: jsonData['last_payment_error'],
      livemode: jsonData['livemode'],
      metadata: jsonData['metadata'],
      nextAction: jsonData['next_action'],
      onBehalfOf: jsonData['on_behalf_of'],
      paymentMethod: jsonData['payment_method'],
      processing: jsonData['processing'],
      receiptEmail: jsonData['receipt_email'],
      review: jsonData['review'],
      setupFutureUsage: jsonData['setup_future_usage'],
      shipping: jsonData['shipping'],
      source: jsonData['source'],
      statementDescriptor: jsonData['statement_descriptor'],
      statementDescriptorSuffix: jsonData['statement_descriptor_suffix'],
      status: jsonData['status'],
      transferData: jsonData['transfer_data'],
      transferGroup: jsonData['transfer_group'],
      latestCharge: jsonData['latest_Charge'],
      automaticPaymentMethods: AutomaticPaymentMethodsModel.fromJson(
        jsonData['automatic_payment_methods'],
      ),
      amountDetails: AmountDetailsModel.fromJson(jsonData['amount_details']),
      paymentMethodTypes: jsonData['payment_method_types'] as List<dynamic>,
      paymentMethodOptions: Paymentmethodoptions.fromJson(
        jsonData['payment_method_options'],
      ),
    );
  }
}
