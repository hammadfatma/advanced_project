import 'package:advanced_complete_course/core/di/dependency_injection.dart';
import 'package:advanced_complete_course/core/routing/app_router.dart';
import 'package:advanced_complete_course/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}