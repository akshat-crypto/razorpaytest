import 'dart:html';

import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  Razorpay razorpay;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlePaymentWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.snackbar(
        'Payment Successful',
        response.orderId +
            "\n" +
            response.paymentId +
            "\n" +
            response.signature);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar("Payment Error Occured", response.message);
  }

  void _handlePaymentWallet(ExternalWalletResponse response) {
    Get.snackbar("External Wallet Successfull", response.walletName);
  }

  void dispatchPayment(int amount, String name, String contact,
      String description, String email, String wallet) {
    var options = {
      'key': 'rzp_test_CVeqoisuce2bax',
      'amount': amount,
      'name': name,
      'description': description,
      'timeout': 80,
      'prefill': {'contact': contact, 'email': email},
      'external': {
        'wallets': [wallet]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {}
  }
}
