part of 'pokemon_list_bloc.dart';

// class abstraite Event, type en commun avec tous nos événements concernant la Home
abstract class PokemonListEvent {
  const PokemonListEvent();
}

// Evénement spécifique pour demander le chargement des pokemons
class PokemonListLoadEvent extends PokemonListEvent {}

class LoadPokemonByType extends PokemonListEvent {
  final List<String> types;

  LoadPokemonByType({required this.types});
}

class LoadPokemonBySearch extends PokemonListEvent {
  final String searchTerm;

  LoadPokemonBySearch({required this.searchTerm});
}
