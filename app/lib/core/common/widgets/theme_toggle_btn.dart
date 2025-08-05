import 'package:app/core/common/cubit/app_cubit.dart';
import 'package:app/core/common/cubit/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeToggleBtn extends StatelessWidget {
  const ThemeToggleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final appCubit = AppCubit.of(context);
        return IconButton(
          icon: Icon(
            appCubit.isDark ? Icons.light_mode : Icons.dark_mode,
            size: 24,
          ),
          onPressed: () => appCubit.toggleTheme(),
        );
      },
    );
  }
}
