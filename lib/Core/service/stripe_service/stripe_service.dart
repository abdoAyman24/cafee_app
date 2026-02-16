import 'package:caffee/Core/service/api_service.dart';
import 'package:caffee/Core/service/payment_api_key.dart';
import 'package:caffee/Feature/payment/data/model/stripe_model/customer_model/customer_model.dart';
import 'package:caffee/Feature/payment/data/model/stripe_model/ephemeral_key/ephemeral_key.dart';
import 'package:caffee/Feature/payment/data/model/stripe_model/initPaymentIntentInputModel.dart';
import 'package:caffee/Feature/payment/data/model/stripe_model/payment_intent_input_model.dart';
import 'package:caffee/Feature/payment/data/model/stripe_model/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService;

  StripeService({required this.apiService});
  //1- create CustomerObject(name ,email)  this to add user data to my stripe account and get CustomerId
  //2- paymentIntenetObject createPaymentIntent(paymentIntentInpotModel)
  //3- create Ephemeral key(CustomerId)
  //3- initPaymentSheet(paymentIntentModel)
  //4- presentPaymentSheet

  // 1 - create customerId
  // do this method when create an account
  Future<CustomerModel> createCustomerId({required String name ,required String email ,required String number ,}) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/customers',
      body: {'name': name, 'email': email, 'phone': number},
      token: PaymentApiKey.stripeSecretKey,
    );
    CustomerModel customerModel = CustomerModel.fromJson(response.data);
    return customerModel;
  }

  //////1- paymentIntenetObject createPaymentIntent(amount,currency)///////////////
  Future<PaymentIntentModel> createPaymentIntent({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentIntentInputModel.toJson(),
      token: PaymentApiKey.stripeSecretKey,
    );
    PaymentIntentModel paymentIntentModel = PaymentIntentModel.fromJson(
      response.data,
    );
    return paymentIntentModel;
  }

  //3-create Ephemeral key
  Future<EphemeralKey> createEphemeralKey({required String customerId}) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      body: {'customer': customerId},
      token: PaymentApiKey.stripeSecretKey,
      headers: {
        'Authorization': "Bearer ${PaymentApiKey.stripeSecretKey}",
        'Stripe-Version': '2023-08-16',
      },
    );
    EphemeralKey ephemeralKey = EphemeralKey.fromJson(response.data);
    return ephemeralKey;
  }

  ///////////  2- initPaymentSheet(paymentIntentModel) ////////////////////
  Future initPaymentSheet({
    required Initpaymentintentinputmodel initpaymentintentinputmodel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        paymentIntentClientSecret:
            initpaymentintentinputmodel.paymentIntentClientSecret,
        merchantDisplayName: 'Flutter Stripe Abdelftah',
        customerEphemeralKeySecret:
            initpaymentintentinputmodel.customerEphemeralKeySecret,
        customerId: initpaymentintentinputmodel.customerId,
      ),
    );
  }

  /////////  3- presentPaymentSheet/////////////
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // this Method to make a all payment Flow in the UP
  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    PaymentIntentModel paymentIntentModel = await createPaymentIntent(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    EphemeralKey ephemeralKey = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );

    Initpaymentintentinputmodel initpaymentintentinputmodel =
        Initpaymentintentinputmodel(
          paymentIntentClientSecret: paymentIntentModel.clientSecret!,
          customerId: paymentIntentInputModel.customerId,
          customerEphemeralKeySecret: ephemeralKey.secret!,
        );
    await initPaymentSheet(
      initpaymentintentinputmodel: initpaymentintentinputmodel,
    );
    await displayPaymentSheet();
  }
}
