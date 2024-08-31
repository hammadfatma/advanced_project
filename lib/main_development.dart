import 'package:advanced_complete_course/core/di/dependency_injection.dart';
import 'package:advanced_complete_course/core/helpers/constants.dart';
import 'package:advanced_complete_course/core/helpers/extensions.dart';
import 'package:advanced_complete_course/core/helpers/shared_pref_helper.dart';
import 'package:advanced_complete_course/core/routing/app_router.dart';
import 'package:advanced_complete_course/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
