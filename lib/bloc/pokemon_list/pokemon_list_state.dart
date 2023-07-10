part of 'pokemon_list_bloc.dart';

class PokemonListState extends Equatable {
  final List<PokemonModel> pokemons;
  final bool isLoading;

  PokemonListState copyWith({List<PokemonModel>? pokemons}) {
    return PokemonListState(
      pokemons: pokemons ?? this.pokemons,
    );
  }

  const PokemonListState({required this.pokemons, this.isLoading = false});

  @override
  List<Object> get props => [pokemons, isLoading];

  @override
  String toString() {
    return 'PokemonListState{pokemons: $pokemons}';
  }
}
