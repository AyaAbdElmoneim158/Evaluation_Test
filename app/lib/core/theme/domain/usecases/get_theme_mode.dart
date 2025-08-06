// lib/core/theme/domain/usecases/get_theme_mode.dart
import '../repositories/theme_repository.dart';

class GetThemeMode {
  final ThemeRepository repository;
  GetThemeMode(this.repository);

  bool call() => repository.getThemeMode();
}
