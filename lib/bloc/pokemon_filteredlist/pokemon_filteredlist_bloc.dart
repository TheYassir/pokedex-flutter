import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon/models/pokemon_model.dart';

part 'pokemon_filteredlist_event.dart';
part 'pokemon_filteredlist_state.dart';

class PokemonFilteredlistBloc
    extends Bloc<PokemonFilteredlistEvent, PokemonFilteredlistState> {
  final List<PokemonModel> initialPokemons;

  PokemonFilteredlistBloc({required this.initialPokemons})
      : super(PokemonFilteredlistState(filteredPokemons: initialPokemons)) {
    on<CalculateFilteredPokemonsEvent>((event, emit) {
      emit(state.copyWith(filteredPokemons: event.filteredPokemons));
    });
  }

  void setFilteredPokemons(
      List<String> filter, List<PokemonModel> pokemons, String searchTerm) {
    List<PokemonModel>? filterPokemons;
    List<PokemonModel> arrayPok = [];
    int loop = 0;

    if (filter.isNotEmpty) {
      do {
        arrayPok.addAll(pokemons
            .where((pokemon) =>
                filter[loop].contains(pokemon.types[0]) ||
                (pokemon.types.length > 1
                    ? filter[loop].contains(pokemon.types[1])
                    : false))
            .toList());

        loop++;
      } while (loop < filter.length);
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
    emit(state.copyWith(filteredPokemons: filterPokemons));
  }
}
