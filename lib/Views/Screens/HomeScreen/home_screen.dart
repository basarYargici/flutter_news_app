import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/Helpers/categories_service.dart';
import 'package:news/Helpers/constants.dart';
import 'package:news/Helpers/news_service.dart';

import 'categories_view.dart';
import 'general_news_view.dart';

// This screen will be the first screen of application. News categories and general news will be shown. App bar will be shown. User will navigated
// to news detail screen or category detail screen. App bar might be disappeared with the scrolling general news listView

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List categoryTileList; // list of category tiles

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryTileList = CategoryService().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("My", style: appbarStyle1),
              Text(
                "News",
                style: appbarStyle2,
              )
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: [
              CategoriesView(
                categoryTileList: categoryTileList,
              ),
              Expanded(child: GeneralNewsView()),
            ],
          ),
        ));
  }
}
