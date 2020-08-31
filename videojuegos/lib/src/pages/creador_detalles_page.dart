import 'package:flutter/material.dart';
import 'package:videojuegos/src/models/creador_model.dart';

class CreadorDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Creador _creador = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _crearAppBar(_creador),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 10.0,
            ),
            _posterCreador(_creador, context),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Grandes aportaciones",
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              ),
            ),
            _descrip(_creador, context)
          ]),
          key: ValueKey('bottom-sliver-list'),
        )
      ],
    ));
  }

  Widget _crearAppBar(Creador creador) {
    return SliverAppBar(
      elevation: 2.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          "Creador ${creador.name}",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(creador.getImageBack()),
          placeholder: AssetImage("assets/img/no-image.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      backgroundColor: Colors.deepOrangeAccent[400],
      floating: false,
      centerTitle: true,
      expandedHeight: 200.0,
    );
  }

  Widget _posterCreador(Creador creador, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 200.0,
            width: 200.0,
            child: Hero(
              tag: creador.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image(
                  image: NetworkImage(creador.getImage()),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  creador.name,
                  style: Theme.of(context).textTheme.title,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.play_for_work),
                    Text(
                      "${creador.gamesCount.toString()} videojuegos",
                      style: Theme.of(context).textTheme.subtitle1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _descrip(Creador creador, BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: _juegos(creador, context),
        ),
      ),
    );
  }

  List<Widget> _juegos(Creador creador, BuildContext context) {
    List<Widget> items = new List<Widget>();
    for (var e in creador.games) {
      final elemento = ListTile(
        title: Text(e.name, style: Theme.of(context).textTheme.title),
        leading: Icon(
          Icons.gamepad,
          color: Colors.deepOrangeAccent,
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: Colors.indigoAccent,
        ),
        hoverColor: Colors.deepOrange,
        focusColor: Colors.deepOrange,
        subtitle: Text(e.added.toString(),
            style: Theme.of(context).textTheme.subtitle1),
        onTap: () {
          Navigator.pushNamed(context, "detalleV", arguments: e.id);
        },
      );
      items.add(elemento);
    }
    return items;
  }
}
