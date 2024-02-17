import 'package:flutter/material.dart';
import 'package:news_snack/views/detailview.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsContainer extends StatefulWidget {
  final String imgUrl;
  final String newsHead;
  final String newsCnt;
  final String newsDes;
  final String newsUrl;
  const NewsContainer(
      {super.key,
      required this.imgUrl,
      required this.newsHead,
      required this.newsCnt,
      required this.newsDes,
      required this.newsUrl});
  @override
  State<NewsContainer> createState() => _NewsContainerState();
}
class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    return  Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    widget.imgUrl),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [SizedBox(height: 20,),
                          Text(
                            widget.newsHead.length > 50
                                ? "${widget.newsHead.substring(0, 50)}..."
                                : widget.newsHead,
                            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.newsDes,
                            style: const TextStyle(fontSize: 12, color: Colors.black38),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                            Text(
                                  widget.newsCnt.length > 100
                                      ? widget.newsCnt.substring(0, 100)
                                      : "${widget.newsCnt.toString().substring(0, widget.newsCnt.length - 15)}...",
                                  style: const TextStyle(fontSize: 16),
                                ),
                        ],
                      ),
                    ),
                  ),

                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailViewScreen(
                                          newsUrl: widget.newsUrl,
                                        )));
                          },
                          child: const Text("Read more")),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
