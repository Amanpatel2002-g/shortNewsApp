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
import 'package:shortnewsapp/views/search/search_page.dart';

import 'constants.dart';

class ScrollPageView extends StatefulWidget {
  @override
  State<ScrollPageView> createState() => _ScrollPageViewState();
}

final ApiWork api = Get.find();

class _ScrollPageViewState extends State<ScrollPageView> {
  List<Article>? list;
  bool isloading = true;
  @override
  void initState() {
    setState(() {
      getdata();
    });
    super.initState();
  }

  getdata() async {
    var mapfromapi = await api.fetechNewsDatatomap();
    // ignore: unrelated_type_equality_checks
    if (mapfromapi != Null) {
      list = mapfromapi.articles!;
      setState(() {
        isloading = false;
      });
    }
  }

  // final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list?.length,
        itemBuilder: (context, index) {
          if (isloading == false) {
            // ignore: unnecessary_null_comparison
            if (list != null) {
              String contenttobesent = list![index].content!;
              var topresent =
                  contenttobesent.length < 600 ? contenttobesent.length : 600;
              return GestureDetector(
                onHorizontalDragUpdate: (details) {
                  print(details);
                  if (details.delta.dx > 5) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  }
                },
                child: NewsPage(
                    imagelink: list![index].urlToImage,
                    headingText: (list![index].title),
                    testText: list![index].description!,
                    articleLink: list![index].url!),
              );
            } else {
              return const Text("The list is null");
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
