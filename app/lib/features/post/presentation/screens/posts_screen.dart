import 'package:app/core/common/widgets/theme_toggle_btn.dart';
import 'package:app/core/utils/app_extension.dart';
import 'package:app/features/post/presentation/cubit/post_cubit.dart';
import 'package:app/features/post/presentation/cubit/post_state.dart';
import 'package:app/features/post/presentation/widgets/post_item.dart';
import 'package:app/features/post/presentation/widgets/post_shimmer_item.dart';
import 'package:app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatelessWidget {
  static const String routeName = '/posts';
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PostsCubit>()..fetchPosts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
          actions: [ThemeToggleBtn()],
        ),
        body: BlocBuilder<PostsCubit, PostsState>(
          builder: (context, state) {
            if (state is PostsLoading) {
              return _buildPostsLoadingStateWidget();
            } else if (state is PostsLoaded) {
              return _buildPostsLoadedStateWidget(state);
            } else if (state is PostsError) {
              return _buildPostsErrorStateWidget(state);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildPostsErrorStateWidget(PostsError state) => Center(child: Text(state.message));

  Widget _buildPostsLoadedStateWidget(PostsLoaded state) {
    return ListView.builder(
      itemCount: state.posts.length,
      itemBuilder: (context, index) {
        final post = state.posts[index];
        if (index % 2 == 0) {
          return PostItem(post: post).slideInRight();
        } else {
          return PostItem(post: post).slideInLeft();
        }
      },
    );
  }

  Widget _buildPostsLoadingStateWidget() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return const PostShimmerItem().fadeIn();
      },
    );
  }
}
