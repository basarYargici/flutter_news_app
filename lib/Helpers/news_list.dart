import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/Models/news_tile_model.dart';

import 'constants.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    Key key,
    @required this.newsTileList,
  }) : super(key: key);

  final List<NewsTileModel> newsTileList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: newsTileList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(alignment: Alignment.bottomCenter, children: [
              CachedNetworkImage(
                imageUrl: newsTileList[index].urlToImage,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Container(
                    width: MediaQuery.of(context).size.width
                    ,height: MediaQuery.of(context).size.height*0.3, child: Icon(Icons.error)),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: Colors.black45,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          newsTileList[index].title,
                          style: titleStyle.copyWith(fontSize: 15),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: 90,
                        child: Column(
                          children: [
                            Expanded(
                              child: Text(
                                newsTileList[index].source,
                                style: titleStyle.copyWith(fontSize: 10),
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                newsTileList[index].publishedAt,
                                style: titleStyle.copyWith(fontSize: 10),
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
            ]),
          ),
        );
      },
    );
  }
}
