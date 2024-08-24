import 'package:advanced_complete_course/core/di/dependency_injection.dart';
import 'package:advanced_complete_course/core/routing/app_router.dart';
import 'package:advanced_complete_course/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
