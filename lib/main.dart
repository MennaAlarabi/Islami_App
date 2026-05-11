import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/app_router.dart';
import 'package:islami/constants/app_color.dart';
import 'package:islami/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final bool onboardingComplete = prefs.getBool('onboarding_complete') ?? false;

  runApp(
    IslamiApp(
      appRouter: AppRouter(onboardingComplete: onboardingComplete),
      onboardingComplete: onboardingComplete,
    ),
  );
}

class IslamiApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool onboardingComplete;

  const IslamiApp({
    super.key,
    required this.appRouter,
    required this.onboardingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColor.secondryColor,
            iconTheme: IconThemeData(color: AppColor.primaryColor),
          ),
          scaffoldBackgroundColor: AppColor.backgrounColor,
        ),
        initialRoute: onboardingComplete ? navBar : onboardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
