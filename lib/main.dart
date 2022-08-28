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
      // theme: ThemeData(
          // brightness: Brightness.light,
          // primaryColor: Colors.lightBlue[800],
          // fontFamily: 'Georgia',
          // textTheme: const TextTheme(
          //   // headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          //   // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          //   // bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          // ),
          // ),
      home: ScrollPageView(),
    );
  }
}
