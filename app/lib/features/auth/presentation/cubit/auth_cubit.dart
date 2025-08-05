import 'package:app/core/utils/shared_pref_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String email, String password) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'Ayatest@test.com' && password == '123456') {
      SharedPrefHelper.setString('user', email);
      emit(AuthSuccess());
    } else {
      emit(AuthFailure("Invalid credentials"));
    }
  }
}