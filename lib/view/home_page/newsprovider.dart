import 'package:flutter/material.dart';
import 'package:newsapplication/core/networkutilits.dart';
import 'package:newsapplication/model/newsmodel/newsmodel.dart';

class NewsProvider with ChangeNotifier {
  List<Article> _articles = [];
  bool _isLoading = false;
  final NetworkUtils networkUtils = NetworkUtils();

  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;

  Future<void> fetchNews() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await networkUtils.getRequest(); 
      NewsModel newsModel = NewsModel.fromJson(response.data);
      _articles = newsModel.articles;
    } catch (e) {
      print('Error fetching news: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
