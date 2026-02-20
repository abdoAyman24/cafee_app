import 'package:caffee/Core/error/auth_faluire_service.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_item_entity.dart';
import 'package:caffee/Feature/payment/data/model/stripe_model/payment_intent_input_model.dart';
import 'package:caffee/Feature/profile/domain/entity/order_details_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PaymentRepos {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
  Future<Either<Failure, void>> addOrders({
    required List<CartItemEntity> cartItems,
  });
  Future<Either<Failure, List<OrderDetailsEntity>>> getOrder({required String userId});
  Stream<Either<Failure, List<OrderDetailsEntity>>> getStreamOrder({required String userId});


}
