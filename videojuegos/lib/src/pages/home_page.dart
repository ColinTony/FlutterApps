import 'package:flutter/material.dart';
import 'package:videojuegos/src/providers/creador_provider.dart';
import 'package:videojuegos/src/providers/videojuego_provider.dart';
import 'package:videojuegos/src/widgets/card_swiper_widget.dart';
import 'package:videojuegos/src/widgets/creadores_horizontal.dart';

class HomePage extends StatelessWidget {
  final VideojuegoProvider _videojuegoProvider = new VideojuegoProvider();
  final CreadorProvider _creadorProvider = new CreadorProvider();
  @override
  Widget build(BuildContext context) {
    _creadorProvider.getListCreadores();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 10.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.yellowAccent,
            onPressed: _buscar,
          ),
        ],
        title: Text("Videojuegos"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[_swipedTarjetas(), _footer(context)],
        ),
      ),
    );
  }

  void _buscar() {
    print("vamos a buscar");
  }

  Widget _swipedTarjetas() {
    return FutureBuilder(
      future: _videojuegoProvider.getListVideogames(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData)
          return CardSwiper(listData: snapshot.data);
        else
          return Container(
              height: 350.0, child: Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          Text(
            "Lista de creadores",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          StreamBuilder(
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return CreadoresHorizontal(
                  creadores: snapshot.data,
                  siguientePagina: _creadorProvider.getListCreadores,
                );
              } else
                return Container(
                  height: 350.0,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
            },
            stream: _creadorProvider.creadoreStream,
          )
        ],
      ),
    );
  }
}
