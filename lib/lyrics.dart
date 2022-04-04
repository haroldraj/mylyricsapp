import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:lyricsapp/helpers.dart';
//import 'package:lyricsapp/lyricsView.dart';

class Lyrics extends StatefulWidget {
  @override
  _LyricsState createState() => _LyricsState();
}

class _LyricsState extends State<Lyrics> {
  final db = Firestore.instance;
  String result = "";
  String artist = "";
  String title = "";
  bool isLoading = false;

  _LyricsState();

  void insertintodb() async {
    DocumentReference docref = await db
        .collection("lyrics")
        .add({"title": title, "artist": artist, "context": result});
  }

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
      //print(jsonResponse["lyrics"]);
      setState(() {
        result = jsonResponse["lyrics"];
        insertintodb();
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("My LyricsApp")),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Artist"),
              onChanged: (text) {
                setState(() {
                  artist = text;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  hintText: "Titre"),
              onChanged: (text) {
                setState(() {
                  title = text;
                });
              },
            ),
            RaisedButton(
              onPressed: () {
                search();
                //  insertintodb();
                /*  goto(
                    context,
                    LyricsView(
                      artist: artist,
                      title: title,
                      result: result,
                    ));*/
              },
              child: Text("Search"),
            ),
            isLoading
                ? Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 25),
                      child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.green)),
                    ),
                  )
                : Expanded(
                    child: SingleChildScrollView(
                    child: Text(result),
                  ))
          ],
        ),
      ),
    );
  }
}
