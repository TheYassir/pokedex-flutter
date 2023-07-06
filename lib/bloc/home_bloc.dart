// ignore_for_file: avoid_print

import 'package:equatable/equatable.dart';
import '../services/pokemon_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/pokemon_model.dart';

part 'home_event.dart';
part 'home_state.dart';

// HomeBloc : responsable de la business logic de la HomePage
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // Constructeur de notre Bloc, on appel super() avec le state initial
  HomeBloc() : super(const HomeState(pokemons: [])) {
    // "Event Handler" : fonction qui sera appelée lorsqu'un event est reçu par notre Bloc
    on<HomeLoadPokemonsEvent>(
        (HomeLoadPokemonsEvent event, Emitter<HomeState> emit) async {
      // print("HomeState : J'ai reçu un event ! $event");
      // En réponse à l'événement, on change d'état : on émet un nouveau State
      HomeState newState = const HomeState(pokemons: [], isLoading: true);
      emit(newState);

      // On fait appel à notre service pour récupérer nos données
      List<PokemonModel> pokemons = await PokemonService.getPokemon();
      // print("HomeState : $pokemons");
      // Notre traitement est fini, on change d'état : on émet un nouveau State
      // Qui contient nos données et on stop le chargement
      emit(HomeState(pokemons: pokemons, isLoading: false));
    });
  }
}
