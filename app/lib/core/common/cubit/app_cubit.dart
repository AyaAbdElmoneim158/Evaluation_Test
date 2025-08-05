import 'package:app/core/common/cubit/app_state.dart';
import 'package:app/core/utils/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit of(BuildContext context) => BlocProvider.of<AppCubit>(context);
  static const String themeMode = 'mode';
  bool isDark = SharedPrefHelper.getBoolean(themeMode) ?? true;
  
  void toggleTheme() {
    isDark = !isDark;
    SharedPrefHelper.setBoolean(themeMode, isDark);
    emit(LanguageChanged());
  }
}
