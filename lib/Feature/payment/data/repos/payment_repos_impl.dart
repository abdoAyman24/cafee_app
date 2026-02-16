import 'dart:developer';

import 'package:caffee/Core/error/auth_faluire_service.dart';
import 'package:caffee/Core/helper/get_user_data.dart';
import 'package:caffee/Core/service/data_base_service.dart';
import 'package:caffee/Core/service/stripe_service/stripe_service.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_item_entity.dart';
import 'package:caffee/Feature/payment/data/model/order_model.dart';
import 'package:caffee/Feature/payment/data/model/stripe_model/payment_intent_input_model.dart';
import 'package:caffee/Feature/payment/domain/repos/payment_repos.dart';
import 'package:caffee/constance.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentReposImpl extends PaymentRepos {
  final StripeService striprService;
  final DataBaseService dataBaseService;

  PaymentReposImpl({
    required this.striprService,
    required this.dataBaseService,
  });
  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await striprService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return Right(null);
    } on StripeException catch (e) {
      return Left(
        ServerFailure(
          message:
              e.error.message ??
              e.error.localizedMessage ??
              'Oops,Something went Wrong',
        ),
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addOrders({
    required List<CartItemEntity> cartItems,
  }) async {
    try {
      List<OrderModel> orderModelList = cartItems
          .map((e) => OrderModel.fromCartItemEntity(e))
          .toList();
      Map<String, dynamic> orderData =
          orderModelList.map((e) => e.toJson()) as Map<String, dynamic>;
      log(
        '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++',
      );
      log('$orderData');
      await dataBaseService.addOrder(
        orderData: orderData,
        orderPath: KOrders,
        userId: getUser().id,
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
