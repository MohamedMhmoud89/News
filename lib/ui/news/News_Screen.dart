import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/api/Api_Manegar.dart';
import 'package:news/api/model/sources_response/SourcesResponse.dart';
import 'package:news/ui/article/Article_Screen.dart';

class NewsScreen extends StatefulWidget {
  static const String routeName = 'news';
  String? titleBar;
  String? category;

  NewsScreen({this.titleBar, this.category});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool isSearch = false;

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
          actions: isSearch
              ? []
              : [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        isSearch = true;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.search_rounded,
                        size: 26,
                      ),
                    ),
                  ),
                ],
          title: isSearch
              ? Container(
                  margin: EdgeInsets.only(right: 50),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Color(0xff39A552), width: 2)),
                  child: TextField(
                    cursorColor: Color(0xff39A552),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search_rounded,
                              color: Color(0xff39A552),
                            )),
                        prefixIcon: IconButton(
                            onPressed: () {
                              isSearch = false;
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.close_rounded,
                              color: Color(0xff39A552),
                            ))),
                  ))
              : Text('${widget.titleBar} News'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: FutureBuilder<SourcesResponse>(
            future: ApiManegar.getNewsSources(widget.category ?? ""),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      spacing: 40,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          response?.message ?? "",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xff42505C))),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Try again',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.white)),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff39A552),
                          ),
                        )
                      ],
                    ),
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
