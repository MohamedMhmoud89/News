import 'dart:ui';

class CategoryModel {
  String title;
  String imageName;
  Color color;
  String id;

  CategoryModel(
      {required this.color,
      required this.title,
      required this.imageName,
      required this.id});
}
