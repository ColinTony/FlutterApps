import 'package:flutter/material.dart';
import 'package:videojuegos/src/models/videojuegos_model.dart';

class DataSearh extends SearchDelegate {
  List<Videojuego> lista = [];
  DataSearh({@required this.lista});

  @override
  List<Widget> buildActions(BuildContext context) {
    // acctiones de AppBar
    List<Widget> listActions = [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
    return listActions;
  }

  @override
  Widget buildLeading(BuildContext context) {
    // icono a la izquierda del appbar

    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // crea los resultados a mostrar
    /*return Center(
      child: Container(
        child: Text(seleccion),
      ),
    );
    */
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // sugerencias cuando la persona escribe
    final listaSugerida = (query.isEmpty)
        ? lista
        : lista.where((e) => e.name.startsWith(query.toLowerCase())).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.games),
          title: Text(listaSugerida[index].name),
          onTap: () {
            Navigator.pushNamed(context, "detalleV",
                arguments: lista[index].id);
          },
        );
      },
      itemCount: listaSugerida.length,
    );
  }
}
