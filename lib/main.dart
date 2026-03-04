import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/app_router.dart';
import 'package:islami/constants/app_color.dart';
import 'package:islami/presentation/screens/Quran/cubit/most_recently_cubit.dart';


void main() {
  runApp(IslamiApp(appRouter: AppRouter()));
}

class IslamiApp extends StatelessWidget {
  AppRouter appRouter;
  IslamiApp({Key? key, required this.appRouter}) : super(key: key);

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
      
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
