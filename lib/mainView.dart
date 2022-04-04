import 'package:flutter/material.dart';
import 'package:lyricsapp/lyricsView.dart';
import 'helpers.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
//import 'dart:convert' as convert;
//import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  String result = "";
  String artist = "";
  String title = "";
  bool isLoading = false;

  void search() async {
    setState(() {
      result = "";
      isLoading = true;
    });

    var url = 'https://api.lyrics.ovh/v1/$artist/$title';
    var response = await http.get(url);
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse["lyrics"]);
      setState(() {
        result = jsonResponse["lyrics"];
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 25, right: 25, top: 150),
      child: Column(
        children: [
          Text(
            "Lyrics",
            style: TextStyle(fontFamily: 'SourceCodePro', fontSize: 40),
          ),
          spacing(height: 25),
          TextField(
              decoration: InputDecoration(hintText: "Artiste Name"),
              onChanged: (text) {
                artist = text;
              }),
          spacing(height: 10),
          TextField(
              decoration: InputDecoration(hintText: "Song's Tite"),
              onChanged: (text) {
                title = text;
              }),
          spacing(height: 20),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.green[400],
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LyricsView(
                          artist: artist,
                          title: title,
                          result: result,
                        )));
              },
              child: Text("Search"),
            ),
          ),
        ],
      ),
    ));
  }
}
