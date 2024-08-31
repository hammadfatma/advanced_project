import 'package:advanced_complete_course/core/helpers/constants.dart';
import 'package:advanced_complete_course/core/routing/app_router.dart';
import 'package:advanced_complete_course/core/routing/routes.dart';
import 'package:advanced_complete_course/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Doc App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: isLoggedInUser? Routes.homeScreen : Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
