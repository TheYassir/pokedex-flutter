part of 'home_bloc.dart';

// State : est responsable de l’état de la HomePage
// contient les données nécéssaire à son affichage
class HomeState extends Equatable {
  final List<PokemonModel> pokemons;
  final bool isLoading;

  const HomeState({required this.pokemons, this.isLoading = false});

  // Ajouter ici les propriétés de mon State, nécéssaire pour BLoC
  // Ne pas oublier de bien rajouter tous les attributs que l'on veut que notre Bloc prene en compte !
  @override
  List<Object> get props => [pokemons, isLoading];
}
