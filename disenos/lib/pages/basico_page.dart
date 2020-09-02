import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _crearImagen(),
          _crearInfo(),
          _crearAcciones(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto()
        ],
      ),
    ));
  }

  Widget _crearImagen() => Container(
        width: double.infinity,
        child: Image(
          height: 300,
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://cdn.pixabay.com/photo/2012/08/27/14/19/evening-55067__340.png'),
        ),
      );
  Widget _crearInfo() => SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "landscape de google.",
                      style: estiloTitulo,
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text(
                      "Bonita imagen de google",
                      style: estiloSubTitulo,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.star,
                color: Colors.red,
                size: 30.0,
              ),
              Text(
                "41",
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      );

  Widget _crearAcciones() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _createAcction(Icons.call, "LLAMAR"),
          _createAcction(Icons.near_me, "RUTA"),
          _createAcction(Icons.share, "COMPARTIR")
        ],
      ),
    );
  }

  Widget _createAcction(IconData ico, String text) {
    return Column(
      children: <Widget>[
        Icon(
          ico,
          color: Colors.blue,
          size: 30.0,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 15.0, color: Colors.blue),
        )
      ],
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 25.0),
        child: Text(
          "Cillum deserunt anim sit ipsum irure adipisicing fugiat eiusmod laboris qui laborum. Aute cillum ipsum aute pariatur ut enim mollit mollit aliqua irure mollit. In magna magna fugiat laborum qui sint magna fugiat ipsum laboris magna aute aute. Ut ea nulla elit sint magna velit eu esse do fugiat enim sint ex cupidatat. Adipisicing id deserunt aliqua fugiat amet minim duis tempor eu. Eu velit duis id sunt irure exercitation nisi exercitation anim esse anim esse fugiat.",
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
