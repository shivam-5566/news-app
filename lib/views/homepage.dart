import 'package:flutter/material.dart';
import 'package:news_snack/controller/newsApiFetch.dart';
import 'package:news_snack/models/newsModels.dart';
import 'package:news_snack/views/widgets/newscontainer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
   NewsModel? newsModel;


  GetNews() async => newsModel = await FetchNews.fetchNews();
  @override
  void setState(VoidCallback fn) {
    bool isLoading = false;
  }

  @override
  void initState() {
    GetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            setState(() {
              isLoading = true;
            });
            GetNews();
          },
          itemBuilder: (context, index) {
            return isLoading? Center(child: CircularProgressIndicator(),): NewsContainer(
                  imgUrl: newsModel!.imgUrl,
                  newsCnt: newsModel!.newsCnt,
                  newsHead: newsModel!.newsHead,
                  newsDes: newsModel!.newsDes,
                  newsUrl: newsModel!.newsUrl);

          }),
    );
  }
}
