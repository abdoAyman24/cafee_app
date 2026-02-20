import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:caffee/Feature/payment/domain/repos/payment_repos.dart';
import 'package:caffee/Feature/profile/domain/entity/order_details_entity.dart';
import 'package:caffee/generated/intl/messages_en.dart';
import 'package:equatable/equatable.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit(this.paymentRepos) : super(GetOrdersInitial());

  final PaymentRepos paymentRepos;

  StreamSubscription? streamSubscription;
  void getOrders({required userId}) async {
    emit(GetOrdersload());
    // var result = await paymentRepos.getOrder(userId: userId);

    // result.fold(
    //   (l) {
    //     emit(GetOrdersFailure(errorMessage: l.message));
    //   },
    //   (r) {
    //     orderDetailsEntityList.addAll(r);
    //     emit(GetOrdersSuccess(orderDetailsEntityList: r));
    //   },
    // );

    streamSubscription = paymentRepos.getStreamOrder(userId: userId).listen((
      result,
    ) {
      result.fold(
        (l) {
          emit(GetOrdersFailure(errorMessage: l.message));
        },
        (r) {
          log('updaet');
          emit(GetOrdersSuccess(orderDetailsEntityList:List<OrderDetailsEntity>.from(r)));
        },
      );
    });
  }

 

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
