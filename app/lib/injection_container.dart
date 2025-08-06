import 'package:app/core/utils/shared_pref_helper.dart';
import 'package:app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:app/features/auth/domain/repository/auth_repository.dart';
import 'package:app/features/post/data/data_sources/posts_local_data_source.dart';
import 'package:app/features/post/data/data_sources/posts_remote_data_source.dart';
import 'package:app/features/post/data/repositories/posts_repository_impl.dart';
import 'package:app/features/post/domain/repositories/posts_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

// Theme (AppCubit)
import 'package:app/core/theme/data/repositories/theme_repository_impl.dart';
import 'package:app/core/theme/domain/repositories/theme_repository.dart';
import 'package:app/core/theme/domain/usecases/get_theme_mode.dart';
import 'package:app/core/theme/domain/usecases/toggle_theme_mode.dart';
import 'package:app/core/theme/presentation/cubit/app_cubit.dart';

// Auth
import 'package:app/features/auth/domain/usecases/login_usecase.dart';
import 'package:app/features/auth/presentation/cubit/auth_cubit.dart';

// Posts
import 'package:app/features/post/domain/usecases/get_posts.dart';
import 'package:app/features/post/presentation/cubit/post_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl
    ..registerLazySingleton(() => sharedPreferences)
    ..registerLazySingleton<SharedPrefHelper>(() => SharedPrefHelper(sl()));

  sl.registerLazySingleton<Dio>(() => Dio());

  // ========== Theme ==========
  sl
    ..registerLazySingleton<ThemeRepository>(() => ThemeRepositoryImpl(sl()))
    ..registerLazySingleton(() => GetThemeMode(sl()))
    ..registerLazySingleton(() => ToggleThemeMode(sl()))
    ..registerFactory(() => AppCubit(getThemeModeUseCase: sl(), toggleThemeModeUseCase: sl()));

  // ========== Auth ==========
  sl
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()))
    ..registerLazySingleton(() => LoginUseCase(sl()))
    ..registerFactory(() => AuthCubit(sl()));

  // ========== Posts ==========
  sl
    // Data sources
    ..registerLazySingleton<PostsRemoteDataSource>(() => PostsRemoteDataSourceImpl(sl()))
    ..registerLazySingleton<PostsLocalDataSource>(() => PostsLocalDataSourceImpl(sl()))
    ..registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(sl(), sl()))
    ..registerLazySingleton(() => GetPosts(sl()))
    ..registerFactory(() => PostsCubit(sl()));
}
