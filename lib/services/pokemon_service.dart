import 'package:flutter/material.dart';

import '../models/pokemon_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class PokemonService {
  static Future<List<PokemonModel>> getPokemon() async {
    final response = await rootBundle.loadString('assets/data.json');
    final List<dynamic> pokemonJson = jsonDecode(response);

    List<PokemonModel> pokemons =
        pokemonJson.map((pokemon) => PokemonModel.fromJson(pokemon)).toList();

    return pokemons;
  }

  static Color pokemonColorCard(PokemonModel pokemon) {
    switch (pokemon.types[0]['type']['name']) {
      case 'grass':
        return const Color.fromRGBO(84, 175, 149, 1);
      case 'fire':
        return const Color.fromRGBO(237, 117, 116, 1);
      case 'water':
        return const Color.fromRGBO(115, 174, 236, 1);
      case 'bug':
        return const Color.fromRGBO(167, 190, 58, 1);
      case 'normal':
        return const Color.fromRGBO(191, 191, 191, 1);
      case 'poison':
        return const Color.fromRGBO(144, 107, 160, 1);
      case 'electric':
        return const Color.fromRGBO(249, 206, 106, 1);
      case 'ground':
        return const Color.fromRGBO(187, 137, 131, 1);
      case 'fairy':
        return const Color.fromRGBO(249, 143, 184, 1);
      case 'fighting':
        return const Color.fromRGBO(223, 102, 100, 1);
      case 'psychic':
        return const Color.fromRGBO(226, 96, 139, 1);
      case 'rock':
        return const Color.fromRGBO(171, 117, 113, 1);
      case 'ghost':
        return const Color.fromRGBO(119, 84, 134, 1);
      case 'ice':
        return const Color.fromRGBO(147, 200, 246, 1);
      case 'dragon':
        return const Color.fromRGBO(56, 96, 214, 1);
      default:
        return const Color.fromARGB(255, 255, 255, 255);
    }
  }

  static Text pokemonIdCard(PokemonModel pokemon) {
    switch (pokemon.id) {
      case >= 100:
        return Text(
          "#${pokemon.id}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        );
      case >= 10:
        return Text(
          "#0${pokemon.id}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        );
      default:
        return Text(
          "#00${pokemon.id}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        );
    }
  }
}
