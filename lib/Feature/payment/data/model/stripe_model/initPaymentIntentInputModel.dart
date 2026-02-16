class Initpaymentintentinputmodel {
  final String paymentIntentClientSecret;
  final String customerId;
  final String customerEphemeralKeySecret;

  Initpaymentintentinputmodel({
    required this.paymentIntentClientSecret,
    required this.customerId,
    required this.customerEphemeralKeySecret,
  });
}
