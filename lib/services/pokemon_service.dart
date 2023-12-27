import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:pokedex_project/pokemon/pokemon.dart';
import 'package:pokedex_project/services/http_interceptor.dart';

class PokemonService {
  static const String url = 'https://pokeapi.co/api/v2/pokemon/';
  final List<Uri> urlList = [];

  http.Client client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);

  Future<List<Uri>> getUrl(String url, int pokemonAmount) async {
    for (var i = pokemonAmount-19; i <= pokemonAmount; i++) {
      Uri localUrl = Uri.parse('$url$i');
      urlList.add(localUrl);
    }
    return urlList;
  }

  Future<List<Pokemon>> getAll(int pokemonAmount) async {
    List urlList = await getUrl(url, pokemonAmount);
    List<Pokemon> pokemonList = [];
    for (var i = 0; i < urlList.length; i++) {
      http.Response response = await client.get(urlList[i]);
      if (response.statusCode > 199 && response.statusCode < 300) {
        Map<String, dynamic> pokemonMap = json.decode(response.body);
        pokemonList.add(Pokemon.fromMap(pokemonMap));
      } else {
        throw ResponseException();
      }
    }
    return pokemonList;
  }
}

class ResponseException implements Exception {}
