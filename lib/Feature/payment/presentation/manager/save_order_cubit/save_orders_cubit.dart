import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_item_entity.dart';
import 'package:caffee/Feature/payment/domain/repos/payment_repos.dart';
import 'package:equatable/equatable.dart';

part 'save_orders_state.dart';

class SaveOrdersCubit extends Cubit<SaveOrdersState> {
  SaveOrdersCubit(this.paymentRepos) : super(SaveOrdersInitial());
  final PaymentRepos paymentRepos;

  Future<void> saveOrderInFireBase({
    required List<CartItemEntity> cartItems,
  }) async {
    emit(SaveOrdersStart());
    var result = await paymentRepos.addOrders(cartItems: cartItems);
    result.fold(
      (l) {
        log('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
        log('Failure');
        log(l.message);
        emit(SaveOrdersFailure(errorMessage: l.message));
      },
      (r) {
        log('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
        log('Success');
      },
    );
  }
}
