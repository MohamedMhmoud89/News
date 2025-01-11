import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/model/Category_Model.dart';

class CategoryWidget extends StatelessWidget {
  CategoryModel category;
  int index;

  CategoryWidget({
    required this.category,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      height: 171,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft:
                index % 2 == 0 ? Radius.circular(25) : Radius.circular(0),
            bottomRight:
                index % 2 == 1 ? Radius.circular(25) : Radius.circular(0),
          ),
          color: category.color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/${category.imageName}.png",
            width: 132,
            height: 116,
          ),
          Text(
            category.title,
            style: GoogleFonts.exo(
                textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)),
          )
        ],
      ),
    );
  }
}
