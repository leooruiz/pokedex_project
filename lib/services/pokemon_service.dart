import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:pokedex_project/pokemons/pokemons.dart';
import 'dart:convert';

import 'package:pokedex_project/services/http_interceptor.dart';

class PokemonService {
  String url1 = 'https://pokeapi.co/api/v2/pokemon-form/';

  http.Client client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);

  Future<List<String>> getUrls() async {
    List<String> urlList = [];
    var i = 1;
    http.Response response = await client.get(Uri.parse('$url1$i'));
    for (var i = 1; response.statusCode != 404; i++) {
      if (response.statusCode > 199 && response.statusCode < 300) {
        //TODO: REPLACE 100 IN FOR TO response.statuscode!=404
        response = await client.get(Uri.parse('$url1$i'));
        String url = '$url1$i';
        urlList.add(url); //TODO: FIX NULL SAFETY
      }
    }
    return urlList;
  }

//<List<Map<String, dynamic>>
  Future<List<Pokemon>> getAll() async {
    List urlList = await getUrls(); // pegando lista de urls neste escopo
    List<Pokemon> pokemonList = [];
    for (int i = 1; i < urlList.length; i++) {
      http.Response response =
          await client.get(Uri.parse(urlList[i])); //acessando cada url da lista
      Map<String, dynamic> pokemonMap = json.decode(response.body);
      pokemonList.add(Pokemon.fromMap(pokemonMap));
    }
    return pokemonList;
  }
}
