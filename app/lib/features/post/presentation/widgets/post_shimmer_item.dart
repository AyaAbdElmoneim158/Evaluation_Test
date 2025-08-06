import 'package:app/core/utils/app_extension.dart';
import 'package:flutter/material.dart';

class PostShimmerItem extends StatelessWidget {
  const PostShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
          ).withShimmer(),
          title: Container(
            height: 16,
            width: double.infinity,
            color: Colors.grey[300],
          ).withShimmer(),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Container(
                height: 12,
                width: double.infinity,
                color: Colors.grey[300],
              ).withShimmer(),
              SizedBox(height: 4),
              Container(
                height: 12,
                width: MediaQuery.of(context).size.width * 0.6,
                color: Colors.grey[300],
              ).withShimmer(),
            ],
          ),
        ),
      ),
    );
  }
}
