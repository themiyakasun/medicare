import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:medicare/features/personalization/controllers/user_controller.dart';
import 'package:medicare/utils/constants/stripe.dart';
import 'package:medicare/utils/helpers/helper_functions.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<bool> makePayment(double amount) async {
    final userController = Get.find<UserController>();
    try {
      String? paymentIntentClientSecret =
          await createPaymentIntent(amount, 'usd');

      if (paymentIntentClientSecret == null) return false;

      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntentClientSecret,
              merchantDisplayName: userController.user.value.name));
      await processPayment();

      return true;
    } catch (e) {
      throw "Making payment Error";
    }
  }

  Future<String?> createPaymentIntent(double amount, String currency) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": THelperFunctions.calculateAmount(amount),
        "currency": currency,
        "payment_method_types[]": "card",
      };

      var response = await dio.post("https://api.stripe.com/v1/payment_intents",
          data: data,
          options:
              Options(contentType: Headers.formUrlEncodedContentType, headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": "application/x-www-form-urlencoded"
          }));

      if (response.data != null && response.data['client_secret'] != null) {
        return response.data['client_secret'];
      }

      return null;
    } catch (e) {
      throw "Payment Intent Error";
    }
  }

  Future<void> processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      throw "Process Payment Error";
    }
  }
}
