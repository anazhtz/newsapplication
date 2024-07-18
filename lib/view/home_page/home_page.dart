import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:newsapplication/core/baseurl.dart';
import 'package:newsapplication/core/conts.dart';
import 'package:newsapplication/model/homepage_model.dart';
import 'package:newsapplication/model/newsmodel/newsmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Article> articles = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await Dio().get(AppUrls.baseUrl);
      NewsModel newsModel = NewsModel.fromJson(response.data);
      setState(() {
        articles = newsModel.articles;
      });
    } catch (e) {
      print('Error fetching news: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'MyNews',
          style: TextStyle(
            fontFamily: "PoppinsBold",
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  CupertinoIcons.location_fill,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "IN",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "PoppinsBold",
                      color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
      backgroundColor: AppColors.appColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Top Headlines',
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        Article article = articles[index];
                        return NewsItem(
                          source: article.source.name,
                          description: article.description ?? '',
                          imageUrl: article.urlToImage ??
                              'https://cdn.iconscout.com/icon/free/png-256/free-no-image-1771002-1505134.png', // Replace with your actual fields
                          time: article.publishedAt.toString(),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
