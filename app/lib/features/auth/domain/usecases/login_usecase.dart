// lib/features/auth/domain/usecases/login_usecase.dart
import 'package:app/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<bool> call(String email, String password) {
    return repository.login(email, password);
  }
}
