import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:social_news/controller/news_controller.dart';
import 'package:social_news/pages/login_signup_page.dart';

import '../model/news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  News news = News();
  List<Article?> articles = [];
  String topic = 'India';
  bool online = false;

  @override
  void initState() {
    chkConnection();
    super.initState();
  }

  Future<void> getData(bool isOnline) async {
    if (isOnline) {
      news = await NewsController.getOnlineNews(topic);
      articles = news.articles ?? [];
      setState(() {});
    } else {
      news = await NewsController.getOfflineNews();
      articles = news.articles ?? [];
      setState(() {});
    }
  }

  void chkConnection() {
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((ConnectivityResult event) async {
      if (ConnectivityResult.none == event) {
        online = false;
        await NewsController.saveOfflineNews(news);
        await getData(false);
      } else {
        online = true;
        await getData(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginSignUpPage()), (route) => false);
        },
        child: const Text(
          'LogOut',
          style: TextStyle(fontSize: 10),
        ),
      ),
      body: SafeArea(
        child: articles.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              )
            : Column(
                children: [
                  Container(
                    height: 60,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(offset: Offset(0, 2), color: Colors.grey, blurRadius: 2)
                    ]),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search_rounded,
                          color: Color.fromARGB(255, 86, 150, 202),
                          size: 35,
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none, hintText: 'India'),
                              style: const TextStyle(
                                  fontSize: 20, color: Color.fromARGB(255, 86, 150, 202)),
                              onSubmitted: (value) {
                                topic = value;
                                getData(true);
                                setState(() {});
                              }),
                        )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height: 180,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 2,
                                      offset: const Offset(0, 2),
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 180,
                                      width: MediaQuery.of(context).size.width - 150,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            articles[index]!.source!.name ?? 'not available',
                                            maxLines: 1,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            articles[index]!.title ?? 'not available',
                                            maxLines: 2,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Color.fromARGB(255, 67, 132, 185),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            articles[index]!.description ?? 'not available',
                                            maxLines: 3,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Color.fromARGB(255, 108, 165, 212),
                                                fontWeight: FontWeight.normal),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                        width: 100,
                                        height: 180,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(Radius.circular(10)),
                                            image: DecorationImage(
                                                filterQuality: FilterQuality.none,
                                                fit: BoxFit.cover,
                                                image: online
                                                    ? Image.network(articles[index]!.urlToImage ??
                                                            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.aRM1jzzcjj9qQo2wCFLO6wHaHa%26pid%3DApi&f=1&ipt=758bb75f6c1831fc62392270ae2cbc5f53994eae2894976c83fd7c0db430a504&ipo=images')
                                                        .image
                                                    : Image.asset('lib/assets/gallery.png').image)),
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        }),
                  ),
                ],
              ),
      ),
    );
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
