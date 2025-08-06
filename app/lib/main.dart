import 'package:app/core/theme/presentation/cubit/app_cubit.dart';
import 'package:app/core/theme/presentation/cubit/app_state.dart';
import 'package:app/core/utils/shared_pref_helper.dart';
import 'package:app/features/auth/presentation/screens/login_screen.dart';
import 'package:app/features/post/presentation/screens/posts_screen.dart';
import 'package:app/features/post/presentation/screens/post_detail_screen.dart';
import 'package:app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  final user = sl<SharedPrefHelper>().getString('user');
  runApp(MyApp(isLoggedIn: user != null));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AppCubit>(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final appCubit = AppCubit.of(context);
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: appCubit.isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData.dark(),
            home: isLoggedIn ? const PostsScreen() : const LoginScreen(),
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
