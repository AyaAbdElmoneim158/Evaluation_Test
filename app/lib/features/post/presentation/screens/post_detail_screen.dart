import 'package:app/core/common/widgets/theme_toggle_btn.dart';
import 'package:app/features/post/domain/entities/post.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  static const routeName = '/post-details';
  const PostDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final post = ModalRoute.of(context)!.settings.arguments as Post;

    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(child: Text(post.id.toString())),
              const SizedBox(width: 8),
              const Text('Posts Details'),
            ],
          ),
          actions: [ThemeToggleBtn()]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              post.body,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
