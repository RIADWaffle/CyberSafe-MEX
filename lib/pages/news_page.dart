// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  static Future<List<News>> getNews() async {
    const url =
        "https://newsapi.org/v2/everything?q=ciberseguridad&from=2023&apiKey=22ec77bb32294fe19bc6116439061998";
    final response = await http.get(Uri.parse(url));
    final body = jsonDecode(response.body);
    return (body['articles'] as List<dynamic>)
        .map<News>((item) => News.fromJson(item))
        .toList();
  }

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Future<List<News>> jsonNews = NewsPage.getNews();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NewsListView(
          newsListFuture: jsonNews,
        ),
      ),
    );
  }
}
