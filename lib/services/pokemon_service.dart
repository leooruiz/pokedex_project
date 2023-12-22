import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:pokedex_project/pokemon/pokemon.dart';
import 'package:pokedex_project/services/http_interceptor.dart';

class PokemonService {
  String url = 'https://pokeapi.co/api/v2/pokemon/';

  http.Client client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);

  Future<List<Uri>> getUrl(String url) async {
    List<Uri> urlList = [];
    for (var i = 1; i <= 50; i++) {
      Uri localUrl = Uri.parse('$url$i');
      urlList.add(localUrl);
    }
    return urlList;
  }

  Future<List<Pokemon>> getAll() async {
    List urlList = await getUrl(url);
    List<Pokemon> pokemonList = [];

    for (int i = 0; i < urlList.length; i++) {
      http.Response response = await client.get(urlList[i]);
      if (response.statusCode > 199 && response.statusCode < 300) {
        Map<String, dynamic> pokemonMap = json.decode(response.body);
        pokemonList.add(Pokemon.fromMap(pokemonMap));
      } else {
        continue;
      }
    }
    if (pokemonList.isNotEmpty) {
      return pokemonList;
    }
    throw ResponseException();
  }
}

class ResponseException implements Exception {}
