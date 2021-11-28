import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news_application/screens/web_view/web_view_screen.dart';

Widget buildArticleItem(article,context) =>
    InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return WebViewScreen(article['url']);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          margin: EdgeInsets.all(12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          shadowColor: Colors.grey,
          elevation: 1.5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: article['urlToImage'] == null
                          ? NetworkImage(
                              'https://thumbs.dreamstime.com/b/invalid-red-stamp-white-background-73707257.jpg')
                          : NetworkImage(
                              '${article['urlToImage']}',
                            ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          '${article['source']['name']}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '${article['title']}',
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
Widget articleBuilder(list) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index],context),
        itemCount: list.length,
      ),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );

