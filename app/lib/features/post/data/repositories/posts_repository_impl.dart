import 'package:app/features/post/data/data_sources/posts_local_data_source.dart';
import 'package:app/features/post/data/data_sources/posts_remote_data_source.dart';
import 'package:app/features/post/domain/entities/post.dart';
import 'package:app/features/post/domain/repositories/posts_repository.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsRemoteDataSource remote;
  final PostsLocalDataSource local;

  PostsRepositoryImpl(this.remote, this.local);

  @override
  Future<List<Post>> getPosts() async {
    try {
      final remotePosts = await remote.getPosts();
      await local.cachePosts(remotePosts);
      return remotePosts;
    } catch (e) {
      final localPosts = await local.getCachedPosts();
      return localPosts;
    }
  }
}
