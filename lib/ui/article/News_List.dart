import 'package:flutter/material.dart';
import 'package:news/api/Api_Manegar.dart';
import 'package:news/api/model/news_response/NewsResponse.dart';
import 'package:news/api/model/sources_response/Source.dart';
import 'package:news/ui/content/Content_Screen.dart';
import 'package:news/ui/widget/News_Widget.dart';

class NewsList extends StatelessWidget {
  Source? source;

  NewsList({this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: ApiManegar.getNews(source?.id ?? ""),
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
          var newsList = snapshot.data?.newsList;
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 20,
            ),
            itemCount: newsList?.length ?? 0,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ContentScreen(
                              news: newsList[index],
                            )));
                  },
                  child: NewsWidget(
                    news: newsList![index],
                  ));
            },
          );
        },
      ),
    );
  }
}
