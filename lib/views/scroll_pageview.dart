import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shortnewsapp/controllers/api_work.dart';
import 'package:shortnewsapp/models/news_data.dart';
import 'package:shortnewsapp/views/newspage.dart';
import 'package:http/http.dart' as http;

class ScrollPageView extends StatefulWidget {
  @override
  State<ScrollPageView> createState() => _ScrollPageViewState();
}

class _ScrollPageViewState extends State<ScrollPageView> {
  @override
  void initState() {
    if (isloading == true) {
      getdata();
    } else {
      super.initState();
    }
  }

  late List<Article> list;
  bool isloading = true;
  getdata() async {
    var mapfromapi = await ApiWork.fetechNewsDatatomap();
    // ignore: unrelated_type_equality_checks
    if (mapfromapi != Null) {
      list = mapfromapi.articles!;
      setState(() {
        isloading = false;
      });
    } else {
      setState(() {
        isloading = true;
      });
    }
  }

  // final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (context, index) {
          if (isloading == false) {
            // ignore: unnecessary_null_comparison
            if (list != null) {
              return NewsPage(
                  imagelink: list![index].urlToImage,
                  headingText: (list![index].title),
                  testText: list![index].description!,
                  articleLink: list![index].url!);
            } else {
              return const Text("15");
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
