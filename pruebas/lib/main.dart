import 'package:flutter/material.dart';
import 'package:pruebas/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Map<String, Widget Function(BuildContext)> _rutas = {
    "/": (BuildContext) => HomePage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "/",
      routes: _rutas,
    );
  }
}
