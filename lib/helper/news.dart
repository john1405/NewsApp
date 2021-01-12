import 'dart:convert';

import 'package:news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&apiKey=6f59e4c526b64b07b13a122bf7162235";

    var response = await http.get(url);

    var jasonData = jsonDecode(response.body);

    if (jasonData['status'] == "ok") {
      jasonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              publishedAt: DateTime.parse(element["publishedAt"]),
              content: element["content"]);

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=6f59e4c526b64b07b13a122bf7162235";

    var response = await http.get(url);

    var jasonData = jsonDecode(response.body);

    if (jasonData['status'] == "ok") {
      jasonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              publishedAt: DateTime.parse(element["publishedAt"]),
              content: element["content"]);

          news.add(articleModel);
        }
      });
    }
  }
}
