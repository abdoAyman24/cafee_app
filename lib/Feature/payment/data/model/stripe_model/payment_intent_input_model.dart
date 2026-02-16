class PaymentIntentInputModel {
  final double amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    required this.customerId,
  });
  toJson() {
    return {
      'amount': (amount * 100).toInt(),
      'currency': currency,
      'customer': customerId,
    };
  }
}
