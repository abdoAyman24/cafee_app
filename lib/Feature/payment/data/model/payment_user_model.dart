class PaymentUserModel {
  final String name;
  final String email;

  PaymentUserModel({required this.name, required this.email});
  Map<String, String> toJson() {
    return {'name': name, 'email': email};
  }
}
