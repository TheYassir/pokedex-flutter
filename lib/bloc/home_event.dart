part of 'home_bloc.dart';

// class abstraite Event, type en commun avec tous nos événements concernant la Home
abstract class HomeEvent {
  const HomeEvent();
}

// Evénement spécifique pour demander le chargement des véhicules
class HomeLoadPokemonsEvent extends HomeEvent {}