import 'dart:convert';

import 'package:news/Constants/global.dart';
import 'package:news/Model/CAtegoryNewsModel.dart';
import 'package:news/Model/Headlinemodel.dart';
import 'package:http/http.dart' as http;
import 'package:news/Model/healinemodelus.dart';

class NewsRepo {
  Future<HeadlineModel> fetchheadline() async {
    String baseurl =
        'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=$apikey1';
    var response = await http.get(Uri.parse(baseurl));

    if (response.statusCode == 200) {
      var finalresponse = jsonDecode(response.body);
      return HeadlineModel.fromJson(finalresponse);
    }
    throw Exception('Error');
  }
  Future<HeadlineModelUS> fetchheadlineus() async {
    String baseurl =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apikey1';
    var response = await http.get(Uri.parse(baseurl));

    if (response.statusCode == 200) {
      var finalresponse = jsonDecode(response.body);
      return HeadlineModelUS.fromJson(finalresponse);
    }
    throw Exception('Error');
  }

  Future<CategoryNewsModel> fetchCategoryNews(String category) async {
    String baseurl =
        'https://newsapi.org/v2/everything?q=$category&apiKey=$apikey1';
    var response = await http.get(Uri.parse(baseurl));

    if (response.statusCode == 200) {
      var finalresponse = jsonDecode(response.body);
      return CategoryNewsModel.fromJson(finalresponse);
    }
    throw Exception('Error');
  }
}
