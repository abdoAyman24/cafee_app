import 'package:bloc/bloc.dart';
import 'package:caffee/Feature/payment/domain/repos/payment_repos.dart';
import 'package:caffee/Feature/profile/domain/entity/order_details_entity.dart';
import 'package:equatable/equatable.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit(this.paymentRepos) : super(GetOrdersInitial());

  final PaymentRepos paymentRepos;
  List<OrderDetailsEntity> orderDetailsEntityList = [];
  Future<void> getOrders({required userId}) async {
    emit(GetOrdersload());
    var result = await paymentRepos.getOrder(userId: userId);

    result.fold(
      (l) {
        emit(GetOrdersFailure(errorMessage: l.message));
      },
      (r) {
        orderDetailsEntityList.addAll(r);
        emit(GetOrdersSuccess(orderDetailsEntityList: r));
      },
    );
  }
}
