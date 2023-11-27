import 'package:cybersafe_mx/utils/newsCards_widget.dart';
import 'package:flutter/material.dart';

class News {
  final String author;
  final String title;
  final String description;
  final String imageUrl;
  final String url;

  News({
    required this.author,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    try {
      return News(
        author: json['author'] ?? 'Unknown Author',
        title: json['title'] ?? 'Untitled',
        description: json['description'] ?? 'No description available',
        imageUrl: json['urlToImage'] ?? 'https://example.com/default-image.jpg',
        url: json['url'] ?? 'No url available',
      );
    } catch (e) {
      // Handle any exceptions that may occur during parsing
      print('Error parsing JSON: $e');
      return News(
          author: 'Error Author',
          title: 'Error Title',
          description: 'Error Description',
          imageUrl: 'https://example.com/error-image.jpg',
          url: 'No url available');
    }
  }
}

class NewsListView extends StatelessWidget {
  final Future<List<News>> newsListFuture;

  NewsListView({required this.newsListFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
      future: newsListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading news'));
        } else {
          List<News> newsList = snapshot.data ?? [];
          // Limit the number of news items to 10

          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "Ultimas noticias en ciberseguridad: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    for (int index = 0; index < newsList.length; index++)
                      CardWidget(
                          author: newsList[index].author,
                          title: newsList[index].title,
                          description: newsList[index].description,
                          imageUrl: newsList[index].imageUrl,
                          url: newsList[index].url),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
