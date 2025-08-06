// lib/features/post/data/datasource/posts_local_data_source.dart

import 'dart:convert';
import 'package:app/features/post/data/model/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostsLocalDataSource {
  Future<void> cachePosts(List<PostModel> posts);
  Future<List<PostModel>> getCachedPosts();
}

class PostsLocalDataSourceImpl implements PostsLocalDataSource {
  static const String cacheKey = 'CACHED_POSTS';

  final SharedPreferences sharedPreferences;

  PostsLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cachePosts(List<PostModel> posts) async {
    final jsonString = jsonEncode(posts.map((e) => e.toJson()).toList());
    await sharedPreferences.setString(cacheKey, jsonString);
  }

  @override
  Future<List<PostModel>> getCachedPosts() async {
    final jsonString = sharedPreferences.getString(cacheKey);
    if (jsonString != null) {
      final List decoded = jsonDecode(jsonString);
      return decoded.map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception('No cached data found');
    }
  }
}
