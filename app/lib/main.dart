import 'package:app/core/common/cubit/app_cubit.dart';
import 'package:app/core/common/cubit/app_state.dart';
import 'package:app/core/utils/shared_pref_helper.dart';
import 'package:app/features/auth/presentation/screens/login_screen.dart';
import 'package:app/features/post/presentation/screens/posts_screen.dart';
import 'package:app/features/post/presentation/screens/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper().instantiatePreferences();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final appCubit = AppCubit.of(context);
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: appCubit.isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData.dark(),
            home: SharedPrefHelper.getString('user') != null ? const PostsScreen() : const LoginScreen(),
            routes: {
              LoginScreen.routeName: (context) => const LoginScreen(),
              PostDetailScreen.routeName: (context) => const PostDetailScreen(),
              PostsScreen.routeName: (context) => const PostsScreen(),
            },
          );
        },
      ),
    );
  }
}
