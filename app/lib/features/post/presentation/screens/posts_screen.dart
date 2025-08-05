import 'package:app/core/common/widgets/theme_toggle_btn.dart';
import 'package:app/core/utils/app_extension.dart';
import 'package:app/features/post/presentation/cubit/post_cubit.dart';
import 'package:app/features/post/presentation/cubit/post_state.dart';
import 'package:app/features/post/presentation/screens/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatelessWidget {
  static const String routeName = '/posts';
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostsCubit()..fetchPosts(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Posts'), actions: [ThemeToggleBtn()]),
        body: BlocBuilder<PostsCubit, PostsState>(
          builder: (context, state) {
            if (state is PostsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostsLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];

                  if (index % 2 == 0) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(child: Text(post.id.toString())),
                          title: Text(post.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                          subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
                          onTap: () {
                            Navigator.pushNamed(context, PostDetailScreen.routeName, arguments: post);
                          },
                        ),
                      ),
                    ).slideInRight();
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(child: Text(post.id.toString())),
                          title: Text(post.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                          subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
                          onTap: () {
                            Navigator.pushNamed(context, PostDetailScreen.routeName, arguments: post);
                          },
                        ),
                      ),
                    ).slideInLeft();
                  }
                },
              );
            } else if (state is PostsError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
