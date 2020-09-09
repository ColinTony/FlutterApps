import 'package:disenos/pages/basico_page.dart';
import 'package:disenos/pages/botones_page.dart';
import 'package:disenos/pages/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Diseños',
      debugShowCheckedModeBanner: false,
      initialRoute: "scrollPage",
      routes: {
        "basico": (BuildContext contex) => BasicoPage(),
        "scrollPage": (BuildContext contex) => ScrollPage(),
        "botonesPage": (BuildContext contex) => BotonesPage()
      },
    );
  }
}
