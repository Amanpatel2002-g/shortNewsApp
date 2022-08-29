import 'package:flutter/material.dart';
import 'package:shortnewsapp/views/home_page.dart';
import 'package:shortnewsapp/views/newspage.dart';
import 'package:shortnewsapp/views/scroll_pageview.dart';

void main(List<String> args) {
  runApp(const MyshortNewsApp());
}

class MyshortNewsApp extends StatelessWidget {
  const MyshortNewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Short News App",
      debugShowCheckedModeBanner: false,
      home: ScrollPageView(),
    );
  }
}
