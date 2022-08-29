import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:shortnewsapp/views/constants.dart';

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
      print("The error in the getimagefromlink is ${e.toString()}");
      return const Text("Sorry we cannot show you image");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (imagelink == null) {
      imagelink =
          "https://thumbs.dreamstime.com/b/no-image-icon-vector-available-picture-symbol-isolated-white-background-suitable-user-interface-element-205805243.jpg";
    }
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
                  child: CachedNetworkImage(
                    imageUrl: imagelink,
                    placeholder: (context, url) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    },
                    // errorWidget: (context, url, error) {
                    //   // This was the reason for exception being triggered and rendered!
                    //   debugPrint(error); // TODO: Remove this line!
                    //   return const Center(
                    //     child: Text(
                    //       'Error',
                    //       style: TextStyle(color: Colors.red),
                    //     ),
                    //   );
                    // },
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
          const Spacer(),
          GestureDetector(
            onTapDown: (details) {},
            child: Container(
              height: MediaQuery.of(context).size.height - 400 - 272,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Card(
                color: Colors.white60,
                elevation: 5,
                
                child: ListTile(title: Text(articleLink)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
