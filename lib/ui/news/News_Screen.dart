import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName = 'news';
  String? titleBar;

  NewsScreen({this.titleBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${titleBar}News'),
      ),
    );
  }
}
