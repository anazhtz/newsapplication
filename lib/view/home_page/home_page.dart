import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsapplication/model/homepage_model.dart';
import 'package:newsapplication/view/home_page/newsprovider.dart';
import 'package:provider/provider.dart';
import 'package:newsapplication/core/conts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewsProvider>(context, listen: false).fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

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
              child: newsProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: newsProvider.articles.length,
                      itemBuilder: (context, index) {
                        final article = newsProvider.articles[index];
                        return NewsItem(
                          source: article.source.name,
                          description: article.description ?? article.title,
                          imageUrl: article.urlToImage ??
                              'https://cdn.iconscout.com/icon/free/png-256/free-no-image-1771002-1505134.png',
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
