
import 'package:caffee/Core/helper/on_generate_route.dart';
import 'package:caffee/Core/service/service_locator.dart';
import 'package:caffee/Core/service/shared_preferences.dart';
import 'package:caffee/Core/utils/AppTheme.dart';
import 'package:caffee/Feature/Auth/Presentation/View/sign_in_view.dart';
import 'package:caffee/main_view.dart';
import 'package:caffee/constance.dart';
import 'package:caffee/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   SharedPreferencesSingleton.init();
  setUpGetIt();
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
      
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme,
          onGenerateRoute: onGenerateRoute,
          initialRoute: SharedPreferencesSingleton.getUser(KUserData) != null
              ? MainView.routeName
              : SignInView.routeName,
        );
      },
    );
  }
}
