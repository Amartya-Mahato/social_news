import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:social_news/model/news.dart';

class NewsApi {
  static Future<News> fetchNews(String topic) async {
    String date = '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';
    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=$topic&from=2023-02-13&sortBy=publishedAt&apiKey=d122f2435f954a72a046f6ca30213f49');
    final respose = await http.get(url);
    var val = json.decode(respose.body);
    News news = News.fromJson(val);
    return news;
  }
}
