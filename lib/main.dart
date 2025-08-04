import 'package:flutter/material.dart';
import 'package:navigation_1/routes/route_constants.dart';
import 'first_page.dart';
import 'second_page.dart';
import 'third_page.dart';
import 'fourth_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      initialRoute: kFirstPage,
      routes: {
        kFirstPage : (context) => FirstPage(),
        kSecondPage : (context) => SecondPage(),
        kThirdPage : (context) => ThirdPage(),
        kFourthPage : (context) => FourthPage(),
      },
    );
  }
}
