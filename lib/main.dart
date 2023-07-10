import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/blocs.dart';
import 'routing/pokedex_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            PokemonListBloc pokemonListBloc = PokemonListBloc();
            pokemonListBloc.add(PokemonListLoadEvent());
            return pokemonListBloc;
          },
        ),
        // BlocProvider<PokemonListBloc>(create: (context) => PokemonListBloc()),
        BlocProvider<PokemonFilterBloc>(
            create: (context) => PokemonFilterBloc()),
        BlocProvider<PokemonSearchBloc>(
            create: (context) => PokemonSearchBloc()),
        BlocProvider<PokemonFilteredlistBloc>(
            create: (context) => PokemonFilteredlistBloc(
                initialPokemons:
                    context.read<PokemonListBloc>().state.pokemons)),
      ],
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
