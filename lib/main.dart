import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_list/pokemon_list_bloc.dart';
import 'routing/pokedex_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        PokemonListBloc pokemonListBloc = PokemonListBloc();
        pokemonListBloc.add(PokemonListLoadEvent());
        return pokemonListBloc;
      },
      child: MaterialApp.router(
        title: "PokeFLutter",
        theme: ThemeData(
          brightness: Brightness.light,
          colorSchemeSeed: Colors.grey,
        ),
        routerConfig: PokedexRouter.router,
      ),
    );
  }
}
