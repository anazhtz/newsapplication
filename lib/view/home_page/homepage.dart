import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapplication/core/conts.dart';
import 'package:newsapplication/model/homepage_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  ))
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
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const NewsItem(
                    source: 'News Source',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vel sapien tellus. Ut ...',
                    imageUrl:
                        'https://www.wikihow.com/images/thumb/7/73/Write-a-Newspaper-Headline-Step-1-Version-3.jpg/v4-460px-Write-a-Newspaper-Headline-Step-1-Version-3.jpg', // Placeholder image URL
                    time: '10 min ago',
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
