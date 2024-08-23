import 'package:advanced_complete_course/features/login/data/models/login_request_body.dart';
import 'package:advanced_complete_course/features/login/data/repos/login_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advanced_complete_course/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.when(success: (loginResponse) {
      emit(
        LoginState.success(loginResponse),
      );
    }, failure: (error) {
      emit(
        LoginState.error(error: error.apiErrorModel.message ?? ''),
      );
    });
  }
}
