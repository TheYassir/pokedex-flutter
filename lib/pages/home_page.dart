import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

import '../components/pokemon_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        // Crée le HomeBloc
        HomeBloc homeBloc = HomeBloc();
        // Envoie immédiatement un événement au bloc
        // pour commencer le chargement de notre liste,
        // dès l'affichage de la page
        homeBloc.add(HomeLoadPokemonsEvent());
        return homeBloc;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(title),
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Liste des Pokemons',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            SizedBox(
                              // height: 300,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.pokemons.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return PokemonCard(
                                        pokemon: state.pokemons[index]);
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          )),
    );
  }
}
