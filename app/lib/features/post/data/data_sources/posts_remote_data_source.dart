import 'package:dio/dio.dart';
import 'package:app/features/post/data/model/post.dart';

abstract class PostsRemoteDataSource {
  Future<List<PostModel>> getPosts();
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  final Dio dio;

  PostsRemoteDataSourceImpl(this.dio); // Inject Dio

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    final List data = response.data;
    return data.map((e) => PostModel.fromJson(e)).toList();
  }
}
