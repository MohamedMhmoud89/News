import 'package:flutter/material.dart';
import 'package:news/api/Api_Manegar.dart';
import 'package:news/api/model/sources_response/SourcesResponse.dart';
import 'package:news/ui/article/Article_Screen.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName = 'news';
  String? titleBar;
  String? category;

  NewsScreen({this.titleBar, this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('$titleBar News'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: FutureBuilder<SourcesResponse>(
            future: ApiManegar.getNewsSources(category ?? ""),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      Text(snapshot.error.toString()),
                      ElevatedButton(onPressed: () {}, child: Text('Try again'))
                    ],
                  ),
                );
              }
              var response = snapshot.data;
              if (response?.status == 'error') {
                return Center(
                  child: Column(
                    children: [
                      Text(response?.message ?? ""),
                      ElevatedButton(onPressed: () {}, child: Text('Try again'))
                    ],
                  ),
                );
              }
              return ArticleScreen(
                sources: response?.sources,
              );
            },
          ),
        ),
      ),
    );
  }
}
