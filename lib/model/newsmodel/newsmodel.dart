class NewsModel {
    String status;
    int totalResults;
    List<Article> articles;

    NewsModel({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

}

class Article {
    Source source;
    String? author;
    String title;
    String? description;
    String url;
    String? urlToImage;
    DateTime publishedAt;
    String? content;

    Article({
        required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

}

class Source {
    String? id;
    String name;

    Source({
        required this.id,
        required this.name,
    });

}
