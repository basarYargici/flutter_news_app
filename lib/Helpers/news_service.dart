import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:news/Helpers/constants.dart';
import 'package:news/Models/news_model.dart';
import 'package:news/Models/news_tile_model.dart';

class NewsService {
  static final String country = "us";
  String url = "https://newsapi.org/v2/top-headlines?country=$country&apiKey=$API_KEY";

  Future<News> getData() async {
    http.Response response = await http.get(url);
    final news = newsFromJson(response.body);
    return news;
  }

  Future<List<NewsTileModel>> getNewsTile() async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    News allNews = await getData();
    List<NewsTileModel> newsTileModelList = List();
    allNews.articles.map((value) {
      if (value.urlToImage != null) {
        newsTileModelList.add(NewsTileModel(
            urlToImage: value.urlToImage,
            title: value.title,
            description: value.description,
            publishedAt: formatter.format(value.publishedAt),
            source: value.source.name));
      }
    }).toList();
    return newsTileModelList;
  }
}
