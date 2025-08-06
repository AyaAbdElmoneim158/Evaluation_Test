import 'package:app/features/post/domain/usecases/get_posts.dart';
import 'package:app/features/post/presentation/cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<PostsState> {
  final GetPosts getPostsUseCase;

  PostsCubit(this.getPostsUseCase) : super(PostsInitial());

  Future<void> fetchPosts() async {
    emit(PostsLoading());
    try {
      final posts = await getPostsUseCase();
      emit(PostsLoaded(posts));
    } catch (e) {
      emit(PostsError(e.toString()));
    }
  }
}
