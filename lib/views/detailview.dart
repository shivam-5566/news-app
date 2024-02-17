import 'package:flutter/material.dart';


class DetailViewScreen extends StatelessWidget {
  const DetailViewScreen({super.key, required String newsUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("News will appear soon!"),
      ),
    );
  }
}
