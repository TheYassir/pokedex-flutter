part of 'pokemon_list_bloc.dart';

// class abstraite Event, type en commun avec tous nos événements concernant la Home
abstract class PokemonListEvent {
  const PokemonListEvent();
}

// Evénement spécifique pour demander le chargement des pokemons
class PokemonListLoadEvent extends PokemonListEvent {}
