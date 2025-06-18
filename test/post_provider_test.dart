import 'package:flutter_test/flutter_test.dart';
import 'package:posts_app/providers/post_provider.dart';
import 'package:posts_app/models/post.dart';

void main() {
  test('filter shows only post with userId == 1', () {
    final provider = PostProvider();

    // Use the test-only injection method
    provider.injectTestPosts([
      Post(id: 1, userId: 1, title: 'Post 1', body: 'Post 1 body'),
      Post(id: 2, userId: 2, title: 'Post 2', body: 'Post 2 body'),
    ]);

    provider.filter('1');

    expect(provider.posts.length, 1);
    expect(provider.posts.first.userId, 1);
    expect(provider.posts.first.title, 'Post 1');
    expect(provider.posts.first.body, 'Post 1 body');
  });
}
