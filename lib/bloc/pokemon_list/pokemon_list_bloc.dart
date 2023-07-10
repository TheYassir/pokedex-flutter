import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/services/pokemon_service.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc() : super(const PokemonListState(pokemons: [])) {
    on<PokemonListLoadEvent>(
        (PokemonListLoadEvent event, Emitter<PokemonListState> emit) async {
      PokemonListState newState =
          const PokemonListState(pokemons: [], isLoading: true);

      emit(newState);

      List<PokemonModel> pokemons = await PokemonService.getPokemon();
      emit(PokemonListState(pokemons: pokemons, isLoading: false));
    });
  }
}
