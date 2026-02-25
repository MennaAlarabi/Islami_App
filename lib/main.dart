import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/features/core/app_color.dart';
import 'package:islami/features/navigation_bar/nav_bar.dart';
import 'package:islami/features/onBoarding/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          appBarTheme: AppBarTheme(
          backgroundColor: AppColor.secondryColor,
          iconTheme: IconThemeData(
            color: AppColor.primaryColor,
          ),
          ),
          scaffoldBackgroundColor: AppColor.backgrounColor,
        ),

        routes: {
          '/' : (context) => OnBoardingPage(),
          NavBar.routName : (context) => NavBar(),
        },
      ),
    );
  }
}

