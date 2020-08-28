import 'package:flutter/material.dart';
import 'package:videojuegos/src/models/videojuego_model_details.dart';
import 'package:videojuegos/src/providers/videojuego_provider.dart';

// En gernearl se puede hacer solo una pagina que reciba un provider
// haciendo la peticion con el id del juego.
// pero para practicar hare otra vista donde haga la peticion
// para ver la complejidad de los mismos
class VideojuegoDetalles extends StatelessWidget {
  final VideojuegoProvider _vprovider = new VideojuegoProvider();

  @override
  Widget build(BuildContext context) {
    final int vd = ModalRoute.of(context).settings.arguments;

    return FutureBuilder(
      builder: (BuildContext context,
          AsyncSnapshot<VideojuegoDetallesModel> snapshot) {
        if (snapshot.hasData)
          return Scaffold(
            body: CustomScrollView(
              slivers: <Widget>[
                _createAppBar(snapshot.data),
                SliverList(
                    delegate: SliverChildListDelegate([
                  SizedBox(
                    height: 10.0,
                  ),
                  _createPosterJuego(context, snapshot.data),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Sipnosis:",
                      style: Theme.of(context).textTheme.title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _descripJuego(snapshot.data, context)
                ]))
              ],
            ),
          );
        else
          return Scaffold(
            appBar: AppBar(
              title: Text("Cardando DAta..."),
              centerTitle: true,
            ),
            body: Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            ),
          );
      },
      future: _vprovider.getVideogameDetails(vd),
    );
  }

  Widget _createAppBar(VideojuegoDetallesModel videojuego) {
    return SliverAppBar(
      elevation: 2.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          "${videojuego.name}",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(videojuego.backgroundImageAdditional),
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

  Widget _createPosterJuego(
      BuildContext context, VideojuegoDetallesModel vdModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 200.0,
            width: 200.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image(
                image: NetworkImage(vdModel.backgroundImage),
                fit: BoxFit.cover,
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
                  "Trofeos: ${vdModel.achievementsCount}",
                  style: Theme.of(context).textTheme.title,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.star),
                    Text(
                      "${vdModel.metacritic} metacritic",
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

  Widget _descripJuego(VideojuegoDetallesModel vdModel, BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Text(
            vdModel.descriptionRaw,
            textAlign: TextAlign.justify,
          )),
    );
  }
}
