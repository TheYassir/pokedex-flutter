import '../models/pokemon_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class PokemonService {
  static Future<List<PokemonModel>> getPokemon() async {
    final response = await rootBundle.loadString('assets/data.json');
    final List<Map<String, dynamic>> pokemonJson = jsonDecode(response);

    List<PokemonModel> pokemons = pokemonJson
        .map((Map<String, dynamic> pokemon) => PokemonModel.fromJson(pokemon))
        .toList();

    return pokemons;
  }
}

  // static Future<List<PokemonModel>> getPokemon() async {
  //   const int countPokemon = 100;
  //   List<PokemonModel> pokemons = [];
  //   int loop = 0;

  //   final response = await http.get(
  //       Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=$countPokemon'));

  //   Map<String, dynamic> datajson = jsonDecode(response.body);
  //   // print(datajson['results'][0]);
  //   // print(jsonDecode(response.body));
  //   if (response.statusCode == 200) {
  //     do {
  //       String url = datajson['results'][loop]['url'];
  //       final req = await http.get(Uri.parse(url));
  //       if (req.statusCode == 200) {
  //         PokemonModel pokemon = PokemonModel.fromJson(jsonDecode(req.body));
  //         pokemons.add(pokemon);
  //       } else {
  //         throw Exception(
  //             "Failed to load ${datajson['results'][loop]['name']}");
  //       }
  //       loop += 1;
  //     } while (loop < countPokemon);
  //     return pokemons;
  //   } else {
  //     throw Exception('Failed to load All Pokemon');
  //   }
  // }
