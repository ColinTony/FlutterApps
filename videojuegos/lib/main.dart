import 'package:flutter/material.dart';
import 'package:videojuegos/src/pages/creador_detalles_page.dart';
import 'package:videojuegos/src/pages/home_page.dart';
import 'package:videojuegos/src/pages/videojuego_detalles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Videojuegos',
      initialRoute: "/",
      routes: {
        "/": (BuildContext) => HomePage(),
        "detalle": (BuildContext) => CreadorDetalle(),
        "detalleV": (BuildContext) => VideojuegoDetalles()
      },
    );
  }
}
