import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/model/news_response/NewsResponse.dart';
import 'package:news/api/model/sources_response/SourcesResponse.dart';

class ApiManegar {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '88cdce95c1e146efb1cb6e244f668127';

  static Future<SourcesResponse> getNewsSources(
    String category,
  ) async {
    var uri = Uri.https(baseUrl, "v2/top-headlines/sources",
        {"apiKey": apiKey, "category": category});
    var response = await http.get(uri);
    var jsonString = response.body;
    var json = jsonDecode(jsonString);
    var sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<NewsResponse> getNews(
      {String? source, String? q, int? page}) async {
    late Uri uri;
    if (page != null) {
      uri = Uri.https(baseUrl, "v2/everything", {
        "apiKey": apiKey,
        "sources": source,
        "page": page.toString(),
        "pageSize": "20"
      });
    } else {
      uri = Uri.https(baseUrl, "v2/everything", {
        "apiKey": apiKey,
        "sources": source,
        "q": q,
      });
    }
    var response = await http.get(uri);
    var jsonString = response.body;
    var json = jsonDecode(jsonString);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
