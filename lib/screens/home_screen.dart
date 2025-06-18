import 'package:flutter/material.dart';
import 'package:posts_app/widgets/scaffold_wrapper.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';
import '../widgets/post_list.dart';
import '../widgets/error_display.dart';

class HomeScreen extends StatelessWidget {
  final _controller = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return ScaffoldWrapper(
      
      title: "All Posts",
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Filter by User ID (1–10)'),
              onChanged: (val) => postProvider.filter(val),
            ),
            if (postProvider.isLoading)
              Center(child: CircularProgressIndicator())
            else if (postProvider.error != null)
              ErrorDisplay(error: postProvider.error!, onRetry: postProvider.retry)
            else
              Expanded(child: PostList(posts: postProvider.posts)),
          ],
        ),
      ),
    );
  }
}
