// lib/core/theme/domain/usecases/toggle_theme_mode.dart
import '../repositories/theme_repository.dart';

class ToggleThemeMode {
  final ThemeRepository repository;
  ToggleThemeMode(this.repository);

  Future<void> call(bool isDark) async {
    await repository.toggleTheme(isDark);
  }
}
