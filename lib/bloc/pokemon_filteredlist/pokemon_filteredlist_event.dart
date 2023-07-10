part of 'pokemon_filteredlist_bloc.dart';

abstract class PokemonFilteredlistEvent extends Equatable {
  const PokemonFilteredlistEvent();
}

class CalculateFilteredPokemonsEvent extends PokemonFilteredlistEvent {
  final List<PokemonModel> filteredPokemons;

  const CalculateFilteredPokemonsEvent({required this.filteredPokemons});

  CalculateFilteredPokemonsEvent copyWith(
      {List<PokemonModel>? filteredPokemons}) {
    return CalculateFilteredPokemonsEvent(
        filteredPokemons: filteredPokemons ?? this.filteredPokemons);
  }

  @override
  List<Object> get props => [filteredPokemons];
}
