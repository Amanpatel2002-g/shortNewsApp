import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  String imagelink;
  final String headingText;
  final String testText;
  final String articleLink;
  NewsPage(
      {Key? key,
      required this.imagelink,
      required this.headingText,
      required this.testText,
      required this.articleLink})
      : super(key: key);
  getimagefromlink(link) {
    try {
      scheduleMicrotask(() => print('MT B'));
      return Image.network(link);
    } catch (e) {
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
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  padding: const EdgeInsets.only(top: 7),
                  child: CachedNetworkImage(
                    imageUrl: imagelink,
                    placeholder: (context, url) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    },
                  ),
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
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        child: Text(
                          testText,
                          style: GoogleFonts.lato(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              await launchUrl(Uri.parse(articleLink));
            },
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 240, 225, 169),
              ),
              child: const Text(
                "click here to read the  entire article",
                style: TextStyle(color: Colors.red, fontSize: 17),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
