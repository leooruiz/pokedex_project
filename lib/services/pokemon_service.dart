import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:pokedex_project/pokemons/pokemons.dart';
import 'package:pokedex_project/services/http_interceptor.dart';

class PokemonService {
  String mainUrl = 'https://pokeapi.co/api/v2/pokemon/';

  http.Client client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);

  Future<List<String>> getUrl(String url) async {
    List<String> urlList = [];
    var i = 1;
    http.Response response = await client.get(Uri.parse('$url$i'));
    for (var i = 1; i < 30; i++) {
      if (response.statusCode > 199 && response.statusCode < 300) {
        response = await client.get(Uri.parse('$url$i'));
        String localUrl = '$url$i';
        urlList.add(localUrl);
      } else {
        throw HttpException;
      }
    }
    return urlList;
  }

  Future<List<Pokemon>> getAll() async {
    List mainUrlList =
        await getUrl(mainUrl);
    List<Pokemon> pokemonList = [];

    for (int i = 0; i < mainUrlList.length; i++) {
      http.Response mainResponse = await client
          .get(Uri.parse(mainUrlList[i]));

      Map<String, dynamic> mainPokemonMap = json.decode(mainResponse.body);
      pokemonList.add(Pokemon.fromMap(mainPokemonMap));
    }
    return pokemonList;
  }
}

class ResponseException {
}
