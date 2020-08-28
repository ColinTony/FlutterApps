import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _ancho = 200.0;
  double _largo = 200.0;
  Color _color = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home soy la mera verga"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(seconds: 1),
                padding: EdgeInsets.only(top: 500.0),
                width: _ancho,
                height: _largo,
                color: _color,
                curve: Curves.elasticIn,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animar,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _animar() {
    setState(() {
      print("animaicon");
      Random random = new Random();
      this._ancho = random.nextInt(400).roundToDouble();
      this._largo = random.nextInt(400).roundToDouble();
      this._color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1.0);
      print("Ancho: $_ancho ");
      print("Largo: $_largo");
    });
  }
}
