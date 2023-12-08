import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:pokedex_project/pokemons/pokemons.dart';
import 'dart:convert';

import 'package:pokedex_project/services/http_interceptor.dart';

class PokemonService {
  String url1 = 'https://pokeapi.co/api/v2/pokemon-form/';

  Future<List<String>> getUrl() async {
    http.Response response =
        await client.get(Uri.parse(url1)); //URL DE TODOS OS POKEMONS
    Map<String, dynamic> map =
        json.decode(response.body); //TRANSFORMANDO DE JSON PARA MAP
    List resultsList =
        map['results']; //PEGANDO A LISTA DE NOMES E URLS DOS POKEMONS
    List<String> urlList = [];
    //GETTING URL
    for (int index = 0; index < resultsList.length; index++) {
      urlList.add(resultsList[index]['url']);
    }
    // print(urlList);
    return urlList;
  }
