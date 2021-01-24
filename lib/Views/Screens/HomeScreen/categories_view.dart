import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/Helpers/constants.dart';

// there will be category tiles with a horizontal listView, each tile widget will be constructed on stack widget(wrapped with gesturededector to
// get clicks). childs: background image from internet(in form of darkened), text which will be the name of category

class CategoriesView extends StatelessWidget {
  final List categoryTileList;

  const CategoriesView({
    Key key,
    this.categoryTileList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        itemCount: categoryTileList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CategoryTile(title: categoryTileList[index].title, imageUrl: categoryTileList[index].imageUrl),
            ),
          );
        },
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CategoryTile({Key key, this.title, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categoryText = Positioned.fill(
        child: Container(
      color: Colors.black38,
      child: Align(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            // navigate page to category_tile_model
            print(title);
          },
          child: FittedBox(
            child: Text(
              title,
              style: categoryStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    ));

    return Stack(
      children: [Image.network(imageUrl), categoryText],
    );
  }
}
