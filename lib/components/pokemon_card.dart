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
    return InkWell(
      onTap: () {
        context.push('/pokemon', extra: pokemon);
      },
      child: Card(
        color: PokemonService.pokemonColorCard(pokemon),
        child: Stack(children: [
          // Image.network(pokemon.img),
          Positioned(
              left: 6, top: 6, child: PokemonService.pokemonIdCard(pokemon)),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Image.network(
              pokemon.img,
              fit: BoxFit.scaleDown,
              filterQuality: FilterQuality.high,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  pokemon.name.replaceFirst(
                    pokemon.name[0],
                    pokemon.name[0].toUpperCase(),
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(right: 6, top: 6, child: Icon(Icons.heart_broken)),
        ]),
      ),
    );
  }
}

//  ListTile(
//   leading: Image.network(pokemon.img),
//   title: Text(
//     pokemon.name
//         .replaceFirst(pokemon.name[0], pokemon.name[0].toUpperCase()),
//     textAlign: TextAlign.center,
//   ),
//   trailing: PokemonService.pokemonIdCard(pokemon),
//   // trailing: const Icon(Icons.heart_broken),
// ),