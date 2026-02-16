import 'package:caffee/Core/error/auth_faluire_service.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_item_entity.dart';
import 'package:caffee/Feature/payment/data/model/stripe_model/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class PaymentRepos {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
  Future<Either<Failure, void>> addOrders({
    required List<CartItemEntity> cartItems,
  });
}
