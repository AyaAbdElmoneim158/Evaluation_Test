import 'package:app/features/post/data/model/post.dart';
import 'package:app/features/post/presentation/cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  final Dio _dio = Dio();

  Future<void> fetchPosts() async {
    emit(PostsLoading());
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        final List<Post> posts = (response.data as List).map((e) => Post.fromJson(e)).toList();
        emit(PostsLoaded(posts));
      } else {
        emit(PostsError('Failed to load posts: ${response.statusCode}'));
      }
    } catch (e) {
      emit(PostsError('Failed to load posts: $e'));
    }
  }
}
