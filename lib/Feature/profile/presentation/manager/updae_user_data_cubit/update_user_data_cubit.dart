import 'package:bloc/bloc.dart';
import 'package:caffee/Feature/Auth/domain/entity/user_entity.dart';
import 'package:caffee/Feature/Auth/domain/repo/user_repo.dart';
import 'package:equatable/equatable.dart';


part 'update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  UpdateUserDataCubit(this._userRepo) : super(UpdateUserDataInitial());
  final UserRepo _userRepo;

  Future<void> updateUserData(UserEntity userEntity) async {
    emit(UpdateUserDataStart());
    var result = await _userRepo.updateUserData(userEntity: userEntity);

    result.fold(
      (l) {
        emit(UpdateUserDataFailure(errorMessage: l.message));
      },
      (r) {
        emit(UpdateUserDatasuccess());
      },
    );
  }
}
