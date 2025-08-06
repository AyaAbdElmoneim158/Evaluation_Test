// lib/core/theme/domain/repositories/theme_repository.dart
abstract class ThemeRepository {
  bool getThemeMode();
  Future<void> toggleTheme(bool isDark);
}
