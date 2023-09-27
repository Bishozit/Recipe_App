import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:food_app/constant/app_colors.dart';
import 'package:food_app/pages/details_page.dart';
import 'package:food_app/pages/home_page.dart';
import 'package:food_app/providers/homeprovider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomePageProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(415, 860),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(appBarTheme: const AppBarTheme(color: AppColors.redAccent)),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
            // home: SplashScreenPage(),
            routes: {
              DetailsPage.routeName: (context) => const DetailsPage(),
            },
          );
        });
  }
}
