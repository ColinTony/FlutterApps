import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            _fondoApp(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[_titulos(), _botonesRedondeados()],
              ),
            )
          ],
        ),
        bottomNavigationBar: _butomNavigationBar(context));
  }

  Widget _fondoApp() {
    final Container gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(52, 54, 101, 1.0),
        Color.fromRGBO(35, 37, 57, 1.0)
      ], begin: FractionalOffset(0.0, 0.6), end: FractionalOffset(0.0, 1.0))),
    );
    final Container cajaRosa = Container(
      height: 360.0,
      width: 360.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(236, 98, 188, 1.0),
            Color.fromRGBO(241, 142, 172, 1.0)
          ]),
          borderRadius: BorderRadius.circular(85.0)),
    );
    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          child: Transform.rotate(
            child: cajaRosa,
            angle: -pi / 5.0,
          ),
          top: -100.0,
        )
      ],
    );
  }

  Widget _titulos() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Classify transaction',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Classify this transaction into particular category',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _butomNavigationBar(BuildContext context) {
    return new Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
            primaryColor: Colors.pinkAccent,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today, size: 25.0),
                title: Container()),
            BottomNavigationBarItem(
                icon: Icon(Icons.bubble_chart, size: 25.0), title: Container()),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle, size: 25.0),
                title: Container())
          ],
        ));
  }

  Widget _botonesRedondeados() {
    return Table(
      children: <TableRow>[
        TableRow(children: <Widget>[
          _crearBotonRedondeado(Colors.blue, Icons.border_all, "General"),
          _crearBotonRedondeado(
              Colors.purpleAccent, Icons.directions_boat, "Bote")
        ]),
        TableRow(children: <Widget>[
          _crearBotonRedondeado(Colors.pinkAccent, Icons.directions_bus, "Bus"),
          _crearBotonRedondeado(Colors.amberAccent, Icons.shop, "Shop")
        ]),
        TableRow(children: <Widget>[
          _crearBotonRedondeado(Colors.orange, Icons.insert_drive_file, "File"),
          _crearBotonRedondeado(
              Colors.blueAccent, Icons.movie_filter, "Entretenimiento")
        ]),
        TableRow(children: <Widget>[
          _crearBotonRedondeado(Colors.green, Icons.cloud, "Grocery"),
          _crearBotonRedondeado(Colors.red, Icons.collections, "Fotos")
        ])
      ],
    );
  }

  Widget _crearBotonRedondeado(Color color, IconData icon, String text) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          height: 180,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.70),
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: color,
                radius: 30.0,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              Text(
                text,
                style: TextStyle(color: Colors.pinkAccent),
              )
            ],
          ),
        ),
      ),
    );
  }
}
