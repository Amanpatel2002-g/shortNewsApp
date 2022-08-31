import 'dart:convert';
import 'package:get/get.dart';

import '../models/news_data.dart';
import 'package:http/http.dart' as http;

class ApiWork extends  GetxController {
  RxString tosearch  = "india".obs;
  Future<NewsData> fetechNewsDatatomap() async {
    String url =
        "https://newsapi.org/v2/everything?q=${tosearch.value}&apiKey=488f3c15eb27460da90b5b8aa0180f54";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return NewsData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load NewsData');
    }
  }
}
