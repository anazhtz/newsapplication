import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final String source;
  final String? description;
  final String? imageUrl;
  final String time;
  final String? content;

  const NewsItem({
    required this.source,
    this.description,
    this.imageUrl,
    required this.time,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      source,
                      style: const TextStyle(
                        fontFamily: "PoppinsBold",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    if (description != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        description!,
                        style: const TextStyle(
                          fontFamily: "PoppinsMedium",
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                    if (content != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        content!,
                        style: const TextStyle(
                          fontFamily: "PoppinsMedium",
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (imageUrl != null) ...[
                const SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    imageUrl!,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
