import 'package:flutter/material.dart';
import 'package:news/api/model/sources_response/Source.dart';
import 'package:news/ui/article/News_List.dart';
import 'package:news/ui/widget/Item_Tab_Widget.dart';

class ArticleScreen extends StatefulWidget {
  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
  List<Source>? sources;
  String? query;
  int? page;

  ArticleScreen({this.sources, this.query, this.page});
}

class _ArticleScreenState extends State<ArticleScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources?.length ?? 0,
      child: Column(
        spacing: 10,
        children: [
          TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            isScrollable: true,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.sources
                    ?.map((source) => ItemTabWidget(
                        selectedIndex == widget.sources?.indexOf(source),
                        source))
                    .toList() ??
                [],
          ),
          Expanded(
              child: NewsList(
            page: widget.page,
            query: widget.query,
            source: widget.sources?[selectedIndex],
          ))
        ],
      ),
    );
  }
}
