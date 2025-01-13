import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/api/model/sources_response/Source.dart';

class ItemTabWidget extends StatelessWidget {
  bool selected;
  Source? source;

  ItemTabWidget(this.selected, this.source);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
      decoration: BoxDecoration(
          color: selected ? Color(0xff39A552) : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Color(0xff39A552), width: 2)),
      child: Text(
        source?.name ?? "",
        style: GoogleFonts.exo(
            textStyle: TextStyle(
                color: selected ? Colors.white : Color(0xff39A552),
                fontSize: 14,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
