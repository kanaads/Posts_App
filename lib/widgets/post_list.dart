import 'package:flutter/material.dart';
import '../models/post.dart';

class PostList extends StatelessWidget {
  final List<Post> posts;

  const PostList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (_, index) {
        final post = posts[index];
        return ListTile(
          title: Text(post.title),
          subtitle: Text("User ID: ${post.userId}"),
        );
      },
    );
  }
}