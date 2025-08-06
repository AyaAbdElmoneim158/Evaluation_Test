import '../entities/post.dart';
import '../repositories/posts_repository.dart';

class GetPosts {
  final PostsRepository repository;
  GetPosts(this.repository);

  Future<List<Post>> call() {
    return repository.getPosts();
  }
}
