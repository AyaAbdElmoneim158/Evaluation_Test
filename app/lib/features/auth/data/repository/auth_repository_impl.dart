import 'package:app/core/utils/shared_pref_helper.dart';
import 'package:app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SharedPrefHelper helper;

  AuthRepositoryImpl(this.helper);

  @override
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'Ayatest@test.com' && password == '123456') {
      await helper.setString('user', email);
      return true;
    } else {
      return false;
    }
  }
}
