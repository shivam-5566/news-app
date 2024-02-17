// https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=7c67f5bbdea14794819d08cd1cb51008

import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_snack/models/newsModels.dart';

class FetchNews {
  static List sourcesId = [
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];
  static Future<NewsModel> fetchNews() async {
    final _random = new Random();
    var sourceId = sourcesId[_random.nextInt(sourcesId.length)];
    print(sourceId);
    Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$sourceId&apiKey=7c67f5bbdea14794819d08cd1cb51008"));
    ;
    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];
    //print(articles);

    final _Newrandom = new Random();

    var myarticles = articles[_random.nextInt(articles.length)];
    print(myarticles);
    return NewsModel.fromAPI2App(myarticles as Map<String, dynamic>);
  }
}
