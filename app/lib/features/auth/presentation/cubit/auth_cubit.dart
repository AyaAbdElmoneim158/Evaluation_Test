// lib/features/auth/presentation/cubit/auth_cubit.dart
import 'package:app/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;

  AuthCubit(this.loginUseCase) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    final success = await loginUseCase(email, password);
    if (success) {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure("Invalid credentials"));
    }
  }
}
