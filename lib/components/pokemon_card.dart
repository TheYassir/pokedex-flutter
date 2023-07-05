import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonCard({
    super.key,
    required this.pokemon,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        leading: Image.network(pokemon.img),
        title: Row(
          children: [
            Text("weight : ${pokemon.weight}"),
            const SizedBox(width: 2),
            Text("id : ${pokemon.id}"),
          ],
        ),
        trailing: Text(pokemon.name),
        // trailing: const Icon(Icons.heart_broken),
      ),
    );
  }
}
