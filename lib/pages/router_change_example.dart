import 'package:flutter/material.dart';
import 'dart:core';
class ArticleDetail extends StatefulWidget {
  @override
  _ArticleDetailState createState() => _ArticleDetailState();
  final String articleId;
  final String title;

  ArticleDetail(this.articleId,this.title);
}

class _ArticleDetailState extends State<ArticleDetail> {

  var b = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text("这篇文章的id是${widget.articleId}"),
            ),
            Center(
              child: RaisedButton(
                child: Text('$b'),
                onPressed: (){
                  setState(() {
                    b++;
                  });
                },
              ),
            )
          ],
        )
    );
  }
}

/*
class ArticleDetail extends StatelessWidget {
  final String articleId;
  final String title;

  ArticleDetail(this.articleId,this.title);
  var b = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Row(
        children: <Widget>[
          Text("这篇文章的id是$articleId"),
          RaisedButton(
            child: Text('$b'),
            onPressed: (){

            },
          )
        ],
      )
    );
  }
}*/
