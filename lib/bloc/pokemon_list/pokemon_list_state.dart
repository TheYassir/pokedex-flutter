part of 'pokemon_list_bloc.dart';

class PokemonListState extends Equatable {
  final List<PokemonModel> pokemons;
  final bool isLoading;
  final String searchTerm;
  final List<String> types;
  final List<PokemonModel> filteredPokemons;

  const PokemonListState(
      {required this.pokemons,
      this.isLoading = false,
      this.searchTerm = '',
      this.types = const [],
      this.filteredPokemons = const []});

  PokemonListState copyWith(
      {List<PokemonModel>? pokemons,
      bool? isLoading,
      String? searchTerm,
      List<String>? types,
      List<PokemonModel>? filteredPokemons}) {
    return PokemonListState(
      pokemons: pokemons ?? this.pokemons,
      isLoading: isLoading ?? this.isLoading,
      searchTerm: searchTerm ?? this.searchTerm,
      types: types ?? this.types,
      filteredPokemons: filteredPokemons ?? this.filteredPokemons,
    );
  }

  @override
  List<Object> get props =>
      [pokemons, isLoading, searchTerm, types, filteredPokemons];

  @override
  String toString() {
    return 'PokemonListState{searchTerm: $searchTerm, types: $types, filteredPokemons: $filteredPokemons}';
  }
}
