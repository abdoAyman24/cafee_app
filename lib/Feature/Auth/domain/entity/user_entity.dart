class UserEntity {
  final String id;
  final String name;
  final String email;
  final String number;
  //Custom id for paypal payment
  final String customerId;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.number, required this.customerId,
  });
}
