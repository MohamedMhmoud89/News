import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/api/model/news_response/News.dart';

class NewsWidget extends StatelessWidget {
  News news;

  NewsWidget({
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(news.urlToImage ?? "")),
          Text(
            news.title ?? "",
            textAlign: TextAlign.start,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff79828B),
                    fontSize: 10)),
          ),
          Text(
            news.description ?? "",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff42505C))),
          ),
          Text(
            news.publishedAt ?? "",
            textAlign: TextAlign.end,
            style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xffA3A3A3),
                    fontSize: 13)),
          )
        ],
      ),
    );
  }
}
