import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(),
        body: Container(
      color: Colors.cyan,
      padding: EdgeInsets.only(left: 20, right: 20, top: 50),
      child: Column(children: [
        Text("CONNEXION", style: TextStyle(color: Colors.red)),
        TextField(
          obscureText: true,
          decoration: InputDecoration(hintText: "Nom"),
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(hintText: "Mot de passe"),
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(hintText: "Téléphone"),
        ),
        Container(
          width: double.infinity,
          child: RaisedButton(
            onPressed: () {},
            child: Text("Se connecter"),
            color: Colors.red,
          ),
        ),
        Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {},
              child: Text("Quitter"),
              color: Colors.yellow,
            )),
        Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {},
              child: Text("Inscription"),
              color: Colors.green,
            ))
      ]),
    ));
  }
}
