import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/api/model/news_response/News.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentScreen extends StatelessWidget {
  static const String routeName = 'content';
  News? news;

  ContentScreen({this.news});

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
          title: Text(news?.title ?? ""),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  news?.urlToImage ?? "",
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        news?.title ?? "",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xff79828B),
                                fontSize: 10)),
                      ),
                      Text(
                        news?.description ?? "",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xff42505C))),
                      ),
                      Text(
                        news?.publishedAt ?? "",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xffA3A3A3),
                                fontSize: 13)),
                      ),
                      Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 24),
                          child: Column(
                            spacing: 30,
                            children: [
                              Text(
                                news?.content ?? "",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xff42505C),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13)),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse(news!.url!);
                                  if (!await launchUrl(
                                    url,
                                    mode: LaunchMode.inAppBrowserView,
                                  )) {
                                    throw Exception('Could not launch $url');
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('View Full Article'),
                                    Icon(Icons.arrow_right)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
