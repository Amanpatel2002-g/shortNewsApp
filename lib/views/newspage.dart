import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:shortnewsapp/views/constants.dart';

class NewsPage extends StatelessWidget {
  final String? imagelink;
  final String headingText;
  final String testText;
  final String articleLink;
  const NewsPage(
      {Key? key,
      required this.imagelink,
      required this.headingText,
      required this.testText,
      required this.articleLink})
      : super(key: key);
  getimagefromlink(link) {
    try {
      return Image.network(link);
    } catch (e) {
      print("The error in the getimagefromlink is ${e.toString()}");
      return const Text("Sorry we cannot show you image");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  child: getimagefromlink(imagelink),
                ),
                const SizedBox(
                  height: 10,
                ),
                // this is the text for heading
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        headingText,
                        style: GoogleFonts.lato(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        testText,
                        // style: const TextStyle(fontSize: 15),
                        style: GoogleFonts.lato(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTapDown: (details) {},
            child: Container(
              height: MediaQuery.of(context).size.height - 400 - 272,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: Card(
                color: Colors.white60,
                elevation: 5,
                child: ListTile(title: Text(articleLink)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
