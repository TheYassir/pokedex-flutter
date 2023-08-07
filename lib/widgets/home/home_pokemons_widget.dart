import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_list/pokemon_list_bloc.dart';
import 'package:pokemon/components/pokemon_card.dart';
import 'package:pokemon/models/pokemon_model.dart';

class HomePokemons extends StatefulWidget {
  const HomePokemons({Key? key}) : super(key: key);

  @override
  State<HomePokemons> createState() => _HomePokemonsState();
}

class _HomePokemonsState extends State<HomePokemons> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<PokemonModel> listpokemons;
    return BlocBuilder<PokemonListBloc, PokemonListState>(
      builder: (context, state) {
        if (state.filteredPokemons.isNotEmpty) {
          listpokemons = state.filteredPokemons;
        } else {
          listpokemons = state.pokemons;
        }
        if (listpokemons.isEmpty) {
          return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red[100],
                boxShadow: const [
                  BoxShadow(color: Colors.red, spreadRadius: 3),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 45,
                    color: Colors.red[800],
                  ),
                  Text(
                    "No results",
                    style: TextStyle(fontSize: 24, color: Colors.red[800]),
                  ),
                  const Text(
                    "You can change filters or search bar",
                    style: TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ));
        } else {
          return Column(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: listpokemons.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 2 / 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return PokemonCard(pokemon: listpokemons[index]);
                  }),
            ],
          );
        }
      },
    );
  }
}
