import 'package:flutter/material.dart';
import 'package:videojuegos/src/models/creador_model.dart';

class CreadoresHorizontal extends StatelessWidget {
  final List<Creador> creadores;
  final Function siguientePagina;
  CreadoresHorizontal(
      {@required this.creadores, @required this.siguientePagina});

  final PageController _pageController = new PageController(
      initialPage: 1, viewportFraction: 0.3, keepPage: false);
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });
    return Container(
      height: _screenSize.height - 569,
      child: PageView.builder(
        itemCount: creadores.length,
        pageSnapping: false,
        controller: _pageController,
        itemBuilder: (BuildContext context, int i) {
          return _tarjetas(context, creadores[i]);
        },
      ),
    );
  }

  Widget _tarjetas(BuildContext context, Creador e) {
    final tarjetita = Container(
      margin: EdgeInsets.only(right: 5.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: FadeInImage(
              fit: BoxFit.cover,
              height: 160.0,
              image: NetworkImage(e.getImage()),
              placeholder: AssetImage("assets/img/loading.gif"),
            ),
          ),
          Expanded(
            child: Text(e.name),
          )
        ],
      ),
    );

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "detalle", arguments: e);
      },
      child: tarjetita,
    );
  }
}
