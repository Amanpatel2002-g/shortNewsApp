import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortnewsapp/controllers/api_work.dart';
import 'package:shortnewsapp/views/scroll_pageview.dart';

import '../constants.dart';
import 'search_input_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ApiWork api = Get.find();

  final TextEditingController _searchController = TextEditingController();

  bool isfunctioncalled = false;

  functionToBeCalled() {
    api.tosearch.value = _searchController.text;
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ScrollPageView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: SearchInputField(
                controller: _searchController,
                icon: Icons.search,
                labelText: "Search here",
                functiontobecalled: functionToBeCalled),
          )
        ]));
  }
}
