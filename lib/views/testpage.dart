import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortnewsapp/views/constants.dart';
import 'package:shortnewsapp/views/search/search_page.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var colorvar = Colors.red;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              if (details.delta.dx > 6) {
                setState(() {
                  Get.to(MaterialApp(
                      debugShowCheckedModeBanner: false,
                      
                      home: SearchPage()));
                });
              }
            },
            child: Center(
              child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                color: colorvar,
              ),
            )),
      ),
    );
  }
}
