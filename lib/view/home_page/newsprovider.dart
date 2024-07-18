import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:newsapplication/core/baseurl.dart';
import 'package:newsapplication/model/newsmodel/newsmodel.dart';

class NewsProvider with ChangeNotifier {
  List<Article> _articles = [];
  bool _isLoading = false;

  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;

  Future<void> fetchNews() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await Dio().get(AppUrls.baseUrl);  
      NewsModel newsModel = NewsModel.fromJson(response.data);
      _articles = newsModel.articles.where((article) {
        return article.urlToImage != null && article.description != null;
      }).toList();
    } catch (e) {
      print('Error fetching news: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
