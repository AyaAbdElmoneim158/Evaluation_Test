import 'package:app/core/utils/shared_pref_helper.dart';
import '../../domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  static const String themeKey = 'mode';

  final SharedPrefHelper _sharedPrefHelper;

  ThemeRepositoryImpl(this._sharedPrefHelper); // Inject via constructor

  @override
  Future<void> toggleTheme(bool isDark) async {
    await _sharedPrefHelper.setBool(themeKey, isDark); // Use instance method
  }

  @override
  bool getThemeMode() {
    return _sharedPrefHelper.getBool(themeKey) ?? true; // Use instance method
  }
}
