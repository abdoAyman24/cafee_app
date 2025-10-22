import 'package:caffee/Core/service/data_base_service.dart';
import 'package:caffee/Core/service/fire_store_service.dart';
import 'package:caffee/Core/service/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setUpGetIt() {
  getIt.registerSingleton<DataBaseService>(FireStoreService());
  getIt.registerSingleton<FireBaseAuthService>(FireBaseAuthService());
  
}
