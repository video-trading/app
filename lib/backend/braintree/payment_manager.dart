import '../cloud_functions/cloud_functions.dart';

export 'package:flutter/foundation.dart';
export 'package:flutter_braintree/flutter_braintree.dart';

final isProdPayments = false;

// Test Braintree Credentials
const kTestBraintreeTokenizationKey = 'sandbox_4xkdqtm5_gvwpzn35yvd2xhzs';
const kTestGoogleMerchantId = '';
const kTestAppleMerchantId = 'merchant.video2trade';

// Production Braintree Credentials
const kProdBraintreeTokenizationKey = '';
const kProdGoogleMerchantId = '';
const kProdAppleMerchantId = '';

String braintreeClientToken() => isProdPayments
    ? kProdBraintreeTokenizationKey
    : kTestBraintreeTokenizationKey;
String googleMerchantId() =>
    isProdPayments ? kProdGoogleMerchantId : kTestGoogleMerchantId;
String appleMerchantId() =>
    isProdPayments ? kProdAppleMerchantId : kTestAppleMerchantId;

class PaymentResponse {
  const PaymentResponse({this.transactionId, this.errorMessage});
  final String? transactionId;
  final String? errorMessage;
}

Future<PaymentResponse> processBraintreePayment(
  double amount,
  String paymentNonce, [
  String? deviceData,
]) async {
  final callName = isProdPayments
      ? 'processBraintreePayment'
      : 'processBraintreeTestPayment';
  final response = await makeCloudCall(
    callName,
    {
      'amount': amount,
      'paymentNonce': paymentNonce,
      if (deviceData != null) 'deviceData': deviceData,
    },
  );
  if (response.containsKey('transactionId')) {
    return PaymentResponse(transactionId: response['transactionId']);
  }
  if (response.containsKey('error')) {
    return PaymentResponse(errorMessage: response['error']);
  }
  return PaymentResponse(errorMessage: 'Unknown error occured');
}

double computeTotal(double baseTotal,
    {double taxRate = 0.0, double shippingCost = 0.0}) {
  final total = baseTotal * (1 + taxRate / 100) + shippingCost;
  return (total * 100).roundToDouble() / 100;
}
