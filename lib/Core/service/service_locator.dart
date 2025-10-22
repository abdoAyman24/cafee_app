import 'package:caffee/Core/service/data_base_service.dart';
import 'package:caffee/Core/service/fire_store_service.dart';
import 'package:caffee/Core/service/firebase_auth_service.dart';
import 'package:caffee/Feature/Auth/data/user_repo_impl.dart';
import 'package:caffee/Feature/Auth/domain/user_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setUpGetIt() {
  getIt.registerSingleton<DataBaseService>(FireStoreService());
  getIt.registerSingleton<FireBaseAuthService>(FireBaseAuthService());
  getIt.registerSingleton<UserRepo>(UserRepoImpl(dataBaseService: getIt.get<DataBaseService>(), fireBaseAuthService: getIt.get<FireBaseAuthService>()));

  
}
