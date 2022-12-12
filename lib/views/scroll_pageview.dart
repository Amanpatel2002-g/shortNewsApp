import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortnewsapp/controllers/api_work.dart';
import 'package:shortnewsapp/models/news_data.dart';
import 'package:shortnewsapp/views/newspage.dart';
import 'package:shortnewsapp/views/search/search_page.dart';
class ScrollPageView extends StatefulWidget {
  const ScrollPageView({Key? key}) : super(key: key);

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
              return GestureDetector(
                onHorizontalDragUpdate: (details) {
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
