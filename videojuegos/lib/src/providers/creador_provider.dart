// pudieramos heredar pero no lo hare

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:videojuegos/src/models/creador_model.dart';

class CreadorProvider {
  int _page = 1;
  bool _isLoading = false;
  List<Creador> _creadores = new List();
  String _url = "api.rawg.io";
  String _path = "/api/creators";
  String _xRapidapiKey = "ac2b859e23msh3693badab62ad3fp10dd85jsnfafc16897ef1";
  String _xRapidapiHost = "rawg-video-games-database.p.rapidapi.com";
  final StreamController<List<Creador>> _creadoreStreamController =
      new StreamController<List<Creador>>.broadcast();

  void disposeStream() {
    _creadoreStreamController?.close();
  }

  // sink and stream
  Function(List<Creador>) get creadoresSink =>
      _creadoreStreamController.sink.add;
  Stream<List<Creador>> get creadoreStream => _creadoreStreamController.stream;

  Future<List<Creador>> getListCreadores() async {
    final Map<String, String> headers = {
      "x-rapidapi-host": _xRapidapiHost,
      "x-rapidapi-key": _xRapidapiKey
    };
    if (_isLoading) return [];
    _isLoading = true;
    _page++;
    final Map<String, String> parametros = {"page": _page.toString()};
    final url = Uri.https(_url, _path, parametros);
    print("=> ${url.toString()}");
    final resp = await http.get(url, headers: headers);

    final decodeData = json.decode(resp.body);
    final Creadores creadores =
        new Creadores.fromJsonList(decodeData["results"]);
    _creadores.addAll(creadores.items);
    creadoresSink(_creadores);
    _isLoading = false;
    return creadores.items;
  }
}
