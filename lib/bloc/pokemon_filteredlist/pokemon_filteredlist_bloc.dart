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
    // List<PokemonModel> arrayPok = [];
    // int loop = 0;

    if (filter.isNotEmpty) {
      // do {
      //   arrayPok.addAll(pokemons
      //       .where((pokemon) =>
      //           filter[loop].contains(pokemon.types[0]['type']['name']))
      //       .toList());
      //   loop++;
      // } while (loop < filter.length);
      // filterPokemons = arrayPok;
      // filterPokemons.sort((a, b) => a.id.compareTo(b.id));
      filterPokemons = pokemons
          .where(
              (pokemon) => filter[0].contains(pokemon.types[0]['type']['name']))
          .toList();
    } else {
      // var test = pokemons[0].types[0]['type']['name'];
      // print(test);
      filterPokemons = pokemons;
    }

    // switch (filter.length) {
    //   case 1:
    //     filterPokemons =
    //         pokemons.where((pokemon) => filter[0].contains(pokemon.types[0].type.name)).toList();
    //     break;
    //   case 2:
    //       filterPokemonsOne =
    //         pokemons.where((pokemon) => filter[0].contains(pokemon.types[0].type.name)).toList();
    //       filterPokemonsTwo =
    //         pokemons.where((pokemon) => filter[1].contains(pokemon.types[0].type.name)).toList();
    //       filterPokemons = filterPokemonsOne + filterPokemonsTwo;
    //       filterPokemons.sort((a, b) => a.id.compareTo(b.id));
    //     break;
    //   default:
    //     filterPokemons = pokemons;
    //     break;
    // }

    if (searchTerm.isNotEmpty) {
      filterPokemons = filterPokemons
          .where((PokemonModel pokemon) =>
              pokemon.name.toLowerCase().contains(searchTerm))
          .toList();
    }
    emit(state.copyWith(filteredPokemons: filterPokemons));
  }
}
