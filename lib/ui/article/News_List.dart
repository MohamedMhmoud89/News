import 'package:flutter/material.dart';
import 'package:news/api/Api_Manegar.dart';
import 'package:news/api/model/news_response/NewsResponse.dart';
import 'package:news/api/model/sources_response/Source.dart';
import 'package:news/ui/content/Content_Screen.dart';
import 'package:news/ui/widget/News_Widget.dart';

class NewsList extends StatefulWidget {
  Source? source;
  String? query;
  int? page;

  NewsList({this.source, this.query, required this.page});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(
      () {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels != 0) {
            if (widget.page != null) {
              widget.page = (widget.page ?? 0) + 1;
              setState(() {});
            }
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: ApiManegar.getNews(
            source: widget.source?.id ?? "",
            q: widget.query,
            page: widget.page),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Color(0xff39A552)),
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
            controller: scrollController,
            separatorBuilder: (context, index) => SizedBox(
              height: 30,
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
