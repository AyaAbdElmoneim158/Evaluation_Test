// lib/core/theme/presentation/cubit/app_cubit.dart
import 'package:app/core/theme/domain/usecases/get_theme_mode.dart';
import 'package:app/core/theme/domain/usecases/toggle_theme_mode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final GetThemeMode getThemeModeUseCase;
  final ToggleThemeMode toggleThemeModeUseCase;

  AppCubit({
    required this.getThemeModeUseCase,
    required this.toggleThemeModeUseCase,
  }) : super(AppInitial()) {
    isDark = getThemeModeUseCase();
  }

  static AppCubit of(BuildContext context) => BlocProvider.of<AppCubit>(context);
  late bool isDark;

  void toggleTheme() async {
    isDark = !isDark;
    await toggleThemeModeUseCase(isDark);
    emit(ThemeChanged());
  }
}
