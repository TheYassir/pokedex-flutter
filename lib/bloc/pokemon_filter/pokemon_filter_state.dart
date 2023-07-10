part of 'pokemon_filter_bloc.dart';

class PokemonFilterState extends Equatable {
  final List<String> filter;

  const PokemonFilterState({required this.filter});

  PokemonFilterState copyWith({List<String>? filter}) {
    return PokemonFilterState(filter: filter ?? this.filter);
  }

  @override
  String toString() {
    return 'FilterState{filter: $filter}';
  }

  @override
  List<Object?> get props => [filter];
}
