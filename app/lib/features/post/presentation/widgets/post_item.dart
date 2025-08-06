import 'package:app/features/post/domain/entities/post.dart';
import 'package:app/features/post/presentation/screens/post_detail_screen.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(post.id.toString())),
        title: Text(post.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
        onTap: () {
          Navigator.pushNamed(context, PostDetailScreen.routeName, arguments: post);
        },
      ),
    );
  }
}
