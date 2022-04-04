//import 'dart:async';

import 'package:flutter/material.dart';
//import 'dart:convert' as convert;
//import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

class LyricsView extends StatefulWidget {
  final String artist;
  final String title;
  final String result;

  LyricsView({this.artist, this.title, this.result});
  @override
  _LyricsViewState createState() => _LyricsViewState();
}

class _LyricsViewState extends State<LyricsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(widget.artist,
                      style: TextStyle(fontFamily: 'NerkoOne', fontSize: 30)),
                ),
                Text(
                  "-",
                  style: TextStyle(fontSize: 30),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(widget.title,
                      style: TextStyle(fontFamily: 'NerkoOne', fontSize: 30)),
                ),
                Container(child: Text(widget.result))
              ],
            )
          ],
        ),
      ),
    );
  }
}
