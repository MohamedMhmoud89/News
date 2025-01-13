import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/model/Category_Model.dart';
import 'package:news/ui/news/News_Screen.dart';
import 'package:news/ui/widget/Category_Widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  List<CategoryModel> categories = [
    CategoryModel(
        id: 'sports',
        color: Color(0xffC91C22),
        title: 'Sports',
        imageName: 'ball'),
    CategoryModel(
        id: 'technology',
        color: Color(0xff003E90),
        title: 'technology',
        imageName: 'Politics'),
    CategoryModel(
        id: 'health',
        color: Color(0xffED1E79),
        title: 'Health',
        imageName: 'health'),
    CategoryModel(
        id: 'business',
        color: Color(0xffCF7E48),
        title: 'Business',
        imageName: 'bussines'),
    CategoryModel(
        id: 'entertainment',
        color: Color(0xff4882CF),
        title: 'Entertainment',
        imageName: 'environment'),
    CategoryModel(
        id: 'science',
        color: Color(0xffF2D352), title: 'Science', imageName: 'science'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("News App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 25,
            children: [
              Text(
                '''Pick your category 
of interest''',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xff4F5A69),
                      fontSize: 22),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => NewsScreen(
                                titleBar: categories[index].title,
                                category: categories[index].id,
                              ),
                            ),
                          );
                        },
                        child: CategoryWidget(
                            category: categories[index], index: index));
                  },
                  itemCount: categories.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
