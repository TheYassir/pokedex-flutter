part of 'pokemon_filteredlist_bloc.dart';

class PokemonFilteredlistState extends Equatable {
  final List<PokemonModel> filteredPokemons;

  const PokemonFilteredlistState({required this.filteredPokemons});

  PokemonFilteredlistState copyWith({List<PokemonModel>? filteredPokemons}) {
    return PokemonFilteredlistState(
        filteredPokemons: filteredPokemons ?? this.filteredPokemons);
  }

  @override
  String toString() {
    return 'PokemonFilteredlistState{filteredPokemons: $filteredPokemons}';
  }

  @override
  List<Object> get props => [filteredPokemons];
}
