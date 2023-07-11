import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/services/pokemon_service.dart';
import 'package:go_router/go_router.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/pokemon', extra: pokemon);
      },
      child: Card(
        color: PokemonService.pokemonColorCard(pokemon),
        child: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              'assets/pokeball.png',
              color: const Color.fromARGB(44, 213, 213, 213),
              cacheWidth: 140,
              cacheHeight: 120,
            ),
          ),
          Positioned(
              left: 6, top: 6, child: PokemonService.pokemonIdCard(pokemon)),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              pokemon.img,
              fit: BoxFit.scaleDown,
              scale: 0.7,
              filterQuality: FilterQuality.high,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  pokemon.name.replaceFirst(
                    pokemon.name[0],
                    pokemon.name[0].toUpperCase(),
                  ),
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 6,
            left: 6,
            right: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: PokemonService.pokemonTypesCard(pokemon),
            ),
          ),
        ]),
      ),
    );
  }
}
