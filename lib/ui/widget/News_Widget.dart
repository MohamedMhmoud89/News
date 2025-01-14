import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/api/model/news_response/News.dart';
import 'package:news/utils/Date_Format.dart';

class NewsWidget extends StatelessWidget {
  News news;

  NewsWidget({
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(news.publishedAt ?? "");

    int timeDate = date.millisecondsSinceEpoch;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? "",
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: Color(0xff39A552),
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
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
            "${formatMessageDate(timeDate)}",
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
