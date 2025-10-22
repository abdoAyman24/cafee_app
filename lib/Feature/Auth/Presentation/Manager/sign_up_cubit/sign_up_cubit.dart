import 'package:bloc/bloc.dart';
import 'package:caffee/Feature/Auth/domain/user_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.userRepo) : super(SignUpInitial());

  final UserRepo userRepo;

  Future<void> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String number,
    required String password,
  }) async {
    emit(SignUpLoad());
    var result = await userRepo.createUserWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
      number: number,
    );
    result.fold(
      (l) {
        emit(SignUpFailure(errorMessage: l.toString()));
      },
      (r) {
        emit(SignUpSuccess());
      },
    );
  }
}
