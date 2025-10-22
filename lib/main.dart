import 'package:caffee/Core/helper/on_generate_route.dart';
import 'package:caffee/Core/utils/AppTheme.dart';
import 'package:caffee/Feature/Auth/Presentation/View/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme,
          onGenerateRoute: onGenerateRoute,
          initialRoute: SignInView.routeName,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
