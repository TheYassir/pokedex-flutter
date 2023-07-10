part of 'pokemon_search_bloc.dart';

class PokemonSearchState extends Equatable {
  final String searchTerm;

  const PokemonSearchState({required this.searchTerm});

  PokemonSearchState copyWith({String? searchTerm}) {
    return PokemonSearchState(searchTerm: searchTerm ?? this.searchTerm);
  }

  @override
  String toString() {
    return 'PokemonSearchState{searchTerm: $searchTerm}';
  }

  @override
  List<Object> get props => [searchTerm];
}
