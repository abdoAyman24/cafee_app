import 'package:caffee/Core/Cubit/favorite_cubit/favorite_cubit.dart';
import 'package:caffee/Core/helper/cache_helper.dart';
import 'package:caffee/Core/helper/on_generate_route.dart';
import 'package:caffee/Core/repo/favorite_repo/favorite_repo.dart';
import 'package:caffee/Core/service/payment_api_key.dart';
import 'package:caffee/Core/service/service_locator.dart';
import 'package:caffee/Core/service/shared_preferences.dart';
import 'package:caffee/Core/utils/AppTheme.dart';
import 'package:caffee/Feature/Auth/Presentation/View/sign_in_view.dart';
import 'package:caffee/Feature/home/domain/product_repo/product_repo.dart';
import 'package:caffee/Feature/home/presentation/manager/product_cubit/product_cubit.dart';
import 'package:caffee/main_view.dart';
import 'package:caffee/constance.dart';
import 'package:caffee/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  //main development
  WidgetsFlutterBinding.ensureInitialized();
  // To Fix Text being Hidding bug Screen Utile in realese modee
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferencesSingleton.init();
  CacheHelper().init();
  Stripe.publishableKey = PaymentApiKey.stripePublishKey;

  setUpGetIt();
  await initializeDateFormatting(KLanguage);
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(192, 245),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ProductCubit(getIt.get<ProductRepo>()),
            ),
            BlocProvider(
              create: (context) =>
                  FavoriteCubit(getIt.get<FavoriteRepo>())..getFavoriteData(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme,

            onGenerateRoute: onGenerateRoute,
            initialRoute: SharedPreferencesSingleton.getUser(KUserData) != null
                ? MainView.routeName
                : SignInView.routeName,
          ),
        );
      },
    );
  }
}
