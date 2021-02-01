import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/Helpers/news_list.dart';
import 'package:news/Helpers/news_service.dart';
import 'package:news/Models/news_tile_model.dart';

// there will be news tiles with a vertical listView below category tiles, each tile widget will be constructed on column widget(wrapped with
// gesturededector to get clicks). childs: 1- stack widget  childs: background image from internet, darkened container below the image and
// news title on it(left aligned), 2- text which will be the news short description

// create model, get data, create newsTile, newsTile list and create listView with this list
class GeneralNewsView extends StatelessWidget {
  const GeneralNewsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NewsTileModel> newsTileList;

    return FutureBuilder(
      future: NewsService().getNewsTile(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          newsTileList = snapshot.data;
          if (snapshot.data != null) {
            return NewsList(newsTileList: newsTileList);
          } else if (snapshot.data == null) {
            return Center(
              child: Text("null"),
            );
          }
        }
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

