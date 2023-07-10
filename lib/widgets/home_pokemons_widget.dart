import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_filter/pokemon_filter_bloc.dart';
import 'package:pokemon/bloc/pokemon_filteredlist/pokemon_filteredlist_bloc.dart';
import 'package:pokemon/bloc/pokemon_list/pokemon_list_bloc.dart';
import 'package:pokemon/bloc/pokemon_search/pokemon_search_bloc.dart';
import 'package:pokemon/components/pokemon_card.dart';

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
    final pokemons =
        context.watch<PokemonFilteredlistBloc>().state.filteredPokemons;
    return MultiBlocListener(
      listeners: [
        BlocListener<PokemonListBloc, PokemonListState>(
          listener: (context, state) {
            context.read<PokemonFilteredlistBloc>().setFilteredPokemons(
                  context.read<PokemonFilterBloc>().state.filter,
                  state.pokemons,
                  context.read<PokemonSearchBloc>().state.searchTerm,
                );
          },
        ),
        BlocListener<PokemonFilterBloc, PokemonFilterState>(
          listener: (context, state) {
            context.read<PokemonFilteredlistBloc>().setFilteredPokemons(
                  state.filter,
                  context.read<PokemonListBloc>().state.pokemons,
                  context.read<PokemonSearchBloc>().state.searchTerm,
                );
          },
        ),
        BlocListener<PokemonSearchBloc, PokemonSearchState>(
          listener: (context, state) {
            context.read<PokemonFilteredlistBloc>().setFilteredPokemons(
                  context.read<PokemonFilterBloc>().state.filter,
                  context.read<PokemonListBloc>().state.pokemons,
                  state.searchTerm,
                );
          },
        ),
      ],
      child: Column(
        children: [
          GridView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: pokemons.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 2 / 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return PokemonCard(pokemon: pokemons[index]);
              }),
        ],
      ),
    );
  }
}
