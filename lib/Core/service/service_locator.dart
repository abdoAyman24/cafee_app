import 'package:caffee/Core/repo/favorite_repo/favorite_repo.dart';
import 'package:caffee/Core/repo/favorite_repo/favorite_repo_impl.dart';
import 'package:caffee/Core/service/api_service.dart';
import 'package:caffee/Core/service/data_base_service.dart';
import 'package:caffee/Core/service/fire_store_service.dart';
import 'package:caffee/Core/service/firebase_auth_service.dart';
import 'package:caffee/Core/service/stripe_service/stripe_service.dart';
import 'package:caffee/Feature/Auth/data/repo_impl/user_repo_impl.dart';
import 'package:caffee/Feature/Auth/domain/repo/user_repo.dart';
import 'package:caffee/Feature/home/data/product_repo_impl/product_repo_impl.dart';
import 'package:caffee/Feature/home/domain/product_repo/product_repo.dart';
import 'package:caffee/Feature/payment/data/repos/payment_repos_impl.dart';
import 'package:caffee/Feature/payment/domain/repos/payment_repos.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setUpGetIt() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<DataBaseService>(FireStoreService());
  getIt.registerSingleton<FireBaseAuthService>(FireBaseAuthService());
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(dataBaseService: getIt.get<DataBaseService>()),
  );
  getIt.registerSingleton<FavoriteRepo>(
    FavoriteRepoImpl(dataBaseService: getIt.get<DataBaseService>()),
  );
  getIt.registerSingleton<ApiService>(ApiService(dio: getIt.get<Dio>()));

 getIt.registerSingleton<StripeService>(
    StripeService(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<UserRepo>(
    UserRepoImpl(
      dataBaseService: getIt.get<DataBaseService>(),
      fireBaseAuthService: getIt.get<FireBaseAuthService>(),
      stripeService: getIt.get<StripeService>()
    ),
  );

 
  getIt.registerSingleton<PaymentRepos>(
    PaymentReposImpl(striprService: getIt.get<StripeService>(),dataBaseService: getIt.get<DataBaseService>()),
  );
}
