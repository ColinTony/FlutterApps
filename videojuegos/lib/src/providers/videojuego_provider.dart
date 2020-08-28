import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:videojuegos/src/models/videojuego_model_details.dart';
import 'package:videojuegos/src/models/videojuegos_model.dart';

class VideojuegoProvider {
  final String _url = "rawg-video-games-database.p.rapidapi.com";
  String _path = "/games";

  final Map<String, String> headers = {
    "x-rapidapi-host": "rawg-video-games-database.p.rapidapi.com",
    "x-rapidapi-key": "ac2b859e23msh3693badab62ad3fp10dd85jsnfafc16897ef1"
  };
  Future<List<Videojuego>> getListVideogames() async {
    final url = Uri.https(_url, _path);
    final resp = await http.get(url, headers: headers);
    final decodeData = json.decode(resp.body);
    final Videojuegos videojuegos =
        new Videojuegos.fromJsonList(decodeData["results"]);
    return videojuegos.items;
  }

  Future<VideojuegoDetallesModel> getVideogameDetails(int id) async {
    String pathGetId = _path + "/$id";
    final url = Uri.https(_url, pathGetId);
    final resp = await http.get(url, headers: headers);
    print("Data = > ${resp.body}");
    final decodeData = json.decode(resp.body);
    final VideojuegoDetallesModel videojuego =
        new VideojuegoDetallesModel.fromJsonMap(decodeData);

    return videojuego;
  }
}
