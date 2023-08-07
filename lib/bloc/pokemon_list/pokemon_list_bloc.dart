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

    List<PokemonModel> setFilteredPokemons(
        {required List<String> types,
        required List<PokemonModel> pokemons,
        required String searchTerm}) {
      List<PokemonModel> filterPokemons;
      List<PokemonModel> arrayPok = [];
      int loop = 0;

      if (types.isNotEmpty) {
        do {
          arrayPok.addAll(pokemons
              .where((pokemon) =>
                  types[loop].contains(pokemon.types[0]) ||
                  (pokemon.types.length > 1
                      ? types[loop].contains(pokemon.types[1])
                      : false))
              .toList());

          loop++;
        } while (loop < types.length);
        Set<PokemonModel> arrayUnique = Set<PokemonModel>.from(arrayPok);

        List<PokemonModel> finalArray = arrayUnique.toList();
        filterPokemons = finalArray;
        filterPokemons.sort((a, b) => a.id.compareTo(b.id));
      } else {
        filterPokemons = pokemons;
      }

      if (searchTerm.isNotEmpty) {
        filterPokemons = filterPokemons
            .where((PokemonModel pokemon) =>
                pokemon.name.toLowerCase().contains(searchTerm))
            .toList();
      }
      return filterPokemons;
    }

    // LoadPokemonBySearch LoadPokemonByType
    // setFilteredPokemons(
    //   pokemons: state.pokemons,
    //   filter: event.filter,
    //   searchTerm: state.searchTerm!
    // ),

    on<LoadPokemonByType>((event, emit) => emit(state.copyWith(
          types: event.types,
          filteredPokemons: setFilteredPokemons(
              pokemons: state.pokemons,
              types: event.types,
              searchTerm: state.searchTerm!),
        )));

    on<LoadPokemonBySearch>((event, emit) => emit(state.copyWith(
          searchTerm: event.searchTerm,
          filteredPokemons: setFilteredPokemons(
              pokemons: state.pokemons,
              searchTerm: event.searchTerm,
              types: state.types!),
        )));
  }
}
