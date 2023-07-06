// import '/components/pokemon_card.dart';
import 'package:pokemon/components/pokedex_appbar.dart';

import '/models/pokemon_model.dart';
import 'package:flutter/material.dart';

class PokemonPage extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PokedexAppBar(title: "Pokemon Page"),
      body: Center(
        child: SizedBox(
          width: 200,
          child: Card(
            child: Image.network(
              pokemon.imgshiny,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ),
    );
  }
}
