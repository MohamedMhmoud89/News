import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/ui/content/Content_Screen.dart';
import 'package:news/ui/home/Home_Screen.dart';
import 'package:news/ui/news/News_Screen.dart';
import 'package:news/ui/splash/Splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff39A552),
          centerTitle: true,
          titleTextStyle: GoogleFonts.exo(
            textStyle: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w400),
          ),
          toolbarHeight: 70,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        NewsScreen.routeName: (_) => NewsScreen(),
        ContentScreen.routeName: (_) => ContentScreen()
      },
    );
  }
}
