import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_service.dart';

class PostProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Post> _allPosts = [];
  List<Post> _visiblePosts = [];
  String? _error;
  bool _isLoading = false;

  List<Post> get posts => _visiblePosts;
  String? get error => _error;
  bool get isLoading => _isLoading;

  Future<void> fetchPosts() async {
  _isLoading = true;
  _error = null;
  notifyListeners();

  try {
    debugPrint('Fetching posts...');
    _allPosts = await _apiService.fetchPosts();
    _visiblePosts = List.from(_allPosts);
    debugPrint('Posts fetched: ${_allPosts.length}');
  } catch (e) {
    debugPrint('Fetch failed: $e');
    _error = 'Failed to load posts. Please try again.';
  }

  _isLoading = false;
  notifyListeners();
}


  void filter(String input) {
    final userId = int.tryParse(input);
    if (userId == null || userId < 1 || userId > 10) {
      _error = 'Enter a number between 1 and 10';
      _visiblePosts = List.from(_allPosts);
    } else {
      _error = null;
      _visiblePosts = _allPosts.where((p) => p.userId == userId).toList();
    }
    notifyListeners();
  }

  void retry() => fetchPosts();
  @visibleForTesting
  void injectTestPosts(List<Post> posts) {
    _allPosts = posts;
    _visiblePosts = List.from(posts);
    _error = null;
    _isLoading = false;
    notifyListeners();
  }
}

