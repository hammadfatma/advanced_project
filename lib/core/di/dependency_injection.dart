import 'package:advanced_complete_course/core/networking/api_service.dart';
import 'package:advanced_complete_course/core/networking/dio_factory.dart';
import 'package:advanced_complete_course/features/home/data/apis/home_api_service.dart';
import 'package:advanced_complete_course/features/home/data/repos/home_repo.dart';
import 'package:advanced_complete_course/features/login/data/repos/login_repo.dart';
import 'package:advanced_complete_course/features/login/logic/cubit/login_cubit.dart';
import 'package:advanced_complete_course/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:advanced_complete_course/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
