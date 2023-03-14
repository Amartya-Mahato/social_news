import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_news/api/news_api.dart';

import '../model/news.dart';

class NewsController {
  static Future<News> getOnlineNews(String topic) async {
    return await NewsApi.fetchNews(topic);
  }

  static Future<News> getOfflineNews() async {
    var pref = await SharedPreferences.getInstance();
    var json = jsonDecode(pref.getString('data') ?? '');
    News news = News.fromJson(json);
    return news;
  }

  static Future<void> saveOfflineNews(News news) async {
    var pref = await SharedPreferences.getInstance();
    var json = jsonEncode(news.toJson());
    pref.setString('data', json);
  }
}
