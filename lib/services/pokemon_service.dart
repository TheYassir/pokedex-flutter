import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    switch (pokemon.types[0]) {
      case 'grass':
        return const Color.fromARGB(210, 84, 175, 149);
      case 'fire':
        return const Color.fromARGB(202, 233, 74, 74);
      case 'water':
        return const Color.fromARGB(212, 115, 173, 236);
      case 'bug':
        return const Color.fromARGB(210, 168, 190, 58);
      case 'normal':
        return const Color.fromARGB(211, 191, 191, 191);
      case 'poison':
        return const Color.fromARGB(213, 166, 109, 190);
      case 'electric':
        return const Color.fromARGB(211, 249, 206, 106);
      case 'ground':
        return const Color.fromARGB(213, 187, 137, 131);
      case 'fairy':
        return const Color.fromARGB(212, 249, 143, 183);
      case 'fighting':
        return const Color.fromARGB(211, 245, 123, 0);
      case 'psychic':
        return const Color.fromARGB(213, 226, 96, 139);
      case 'rock':
        return const Color.fromARGB(213, 139, 95, 91);
      case 'ghost':
        return const Color.fromARGB(213, 107, 68, 125);
      case 'ice':
        return const Color.fromARGB(211, 147, 200, 246);
      case 'dragon':
        return const Color.fromARGB(212, 56, 96, 214);
      case 'flying':
        return const Color.fromARGB(212, 147, 200, 246);
      case 'dark':
        return const Color.fromARGB(212, 90, 87, 97);
      case 'steel':
        return const Color.fromARGB(212, 149, 148, 148);
      default:
        return const Color.fromARGB(212, 255, 255, 255);
    }
  }

  static Text pokemonIdCard(PokemonModel pokemon) {
    switch (pokemon.id) {
      case >= 100:
        return Text(
          "#${pokemon.id}",
          style: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        );
      case >= 10:
        return Text(
          "#0${pokemon.id}",
          style: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        );
      default:
        return Text(
          "#00${pokemon.id}",
          style: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        );
    }
  }

  static List<SizedBox> pokemonTypesCard(PokemonModel pokemon) {
    List<SizedBox> pokemonTypesIcons = [];

    List array = pokemon.types;
    var i = 0;
    do {
      switch (pokemon.types[i]) {
        case 'grass':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(91, 190, 97, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/grass.svg',
                semanticsLabel: 'Grass Type Icon',
                height: 16,
                width: 16,
              ),
            ),
          ));
        case 'fire':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(253, 166, 89, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/fire.svg',
                semanticsLabel: 'Fire Type Icon',
                height: 20,
                width: 20,
              ),
            ),
          ));
        case 'water':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(80, 157, 219, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/water.svg',
                semanticsLabel: 'Water Type Icon',
                height: 18,
                width: 18,
              ),
            ),
          ));
        case 'bug':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(145, 189, 65, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/bug.svg',
                semanticsLabel: 'Bug Type Icon',
                height: 20,
                width: 20,
              ),
            ),
          ));
        case 'normal':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(160, 162, 159, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/normal.svg',
                semanticsLabel: 'Normal Type Icon',
                height: 18,
                width: 18,
              ),
            ),
          ));
        case 'poison':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(186, 98, 203, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/poison.svg',
                semanticsLabel: 'Poison Type Icon',
                height: 16,
                width: 16,
              ),
            ),
          ));
        case 'electric':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(243, 218, 97, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/electric.svg',
                semanticsLabel: 'Electric Type Icon',
                height: 18,
                width: 18,
              ),
            ),
          ));
        case 'ground':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(221, 124, 84, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/ground.svg',
                semanticsLabel: 'Ground Type Icon',
                height: 18,
                width: 18,
              ),
            ),
          ));
        case 'fairy':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(240, 143, 227, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/fairy.svg',
                semanticsLabel: 'Fairy Type Icon',
                height: 20,
                width: 20,
              ),
            ),
          ));
        case 'fighting':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(214, 66, 97, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/fighting.svg',
                semanticsLabel: 'Fighting Type Icon',
                height: 16,
                width: 16,
              ),
            ),
          ));
        case 'psychic':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(254, 133, 132, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/psychic.svg',
                semanticsLabel: 'Psychic Type Icon',
                height: 16,
                width: 16,
              ),
            ),
          ));
        case 'rock':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(202, 187, 142, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/rock.svg',
                semanticsLabel: 'Rock Type Icon',
                height: 16,
                width: 16,
              ),
            ),
          ));
        case 'ghost':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(95, 109, 184, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/ghost.svg',
                semanticsLabel: 'Ghost Type Icon',
                height: 16,
                width: 16,
              ),
            ),
          ));
        case 'ice':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(113, 208, 193, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/ice.svg',
                semanticsLabel: 'Ice Type Icon',
                height: 20,
                width: 20,
              ),
            ),
          ));
        case 'dragon':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(0, 104, 196, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/dragon.svg',
                semanticsLabel: 'Dragon Type Icon',
                height: 20,
                width: 20,
              ),
            ),
          ));
        case 'flying':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(160, 187, 233, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/flying.svg',
                semanticsLabel: 'Flying Type Icon',
                height: 20,
                width: 20,
              ),
            ),
          ));
        case 'dark':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(89, 87, 97, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/dark.svg',
                semanticsLabel: 'Dark Type Icon',
                height: 20,
                width: 20,
              ),
            ),
          ));
        case 'steel':
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(83, 149, 162, 1),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/steel.svg',
                semanticsLabel: 'Steel Type Icon',
                height: 16,
                width: 16,
              ),
            ),
          ));
        default:
          pokemonTypesIcons.add(SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              child: SvgPicture.network(
                'https://raw.githubusercontent.com/duiker101/pokemon-type-svg-icons/master/icons/fairy.svg',
                semanticsLabel: 'Error Type Icon',
                height: 20,
                width: 20,
              ),
            ),
          ));
      }
      i++;
    } while (i < array.length);
    return pokemonTypesIcons;
  }
}
