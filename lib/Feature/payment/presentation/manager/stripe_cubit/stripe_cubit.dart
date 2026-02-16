import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:caffee/Feature/payment/data/model/stripe_model/payment_intent_input_model.dart';
import 'package:caffee/Feature/payment/domain/repos/payment_repos.dart';
import 'package:meta/meta.dart';

part 'stripe_state.dart';

class StripeCubit extends Cubit<StripeState> {
  StripeCubit(this.paymentRepos) : super(StripeInitial());
  final PaymentRepos paymentRepos;

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(StripeLoad());
    var result = await paymentRepos.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );

    result.fold((l) {
      log(l.message);
      emit(StripeFailure(errorMessage: l.message));
    }, (r) => emit(StripeSuccess()));
  }

  @override
  void onChange(Change<StripeState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
