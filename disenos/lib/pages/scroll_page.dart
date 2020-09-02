import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pagina1(),
          _pagina2(),
        ],
      ),
    );
  }

  Widget _pagina1() => Stack(
        children: <Widget>[_colorFondo(), _imagenFondo(), _textos()],
      );
  Widget _pagina2() => Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: RaisedButton(
          shape: StadiumBorder(),
          onPressed: () => print("Hola"),
          color: Colors.blue,
          elevation: 10.0,
          textColor: Colors.white,
          child: Text(
            "Bienvenido",
            style: TextStyle(fontSize: 20.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        )),
        color: Color.fromRGBO(108, 192, 218, 1.0),
      );

  Widget _colorFondo() => Container(
        color: Color.fromRGBO(108, 192, 218, 1.0),
        width: double.infinity,
        height: double.infinity,
      );

  Widget _imagenFondo() => Container(
        child: Image(
          image: AssetImage("assets/scroll-1.png"),
          fit: BoxFit.cover,
        ),
        width: double.infinity,
        height: double.infinity,
      );

  Widget _textos() {
    final estilo = TextStyle(color: Colors.white, fontSize: 50.0);
    final column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "11°",
          style: estilo,
        ),
        Text(
          "Miercoles",
          style: estilo,
        ),
        Expanded(child: Container()),
        Icon(
          Icons.keyboard_arrow_down,
          size: 70.0,
          color: Colors.white,
        )
      ],
    );
    return SafeArea(child: column);
  }
}
