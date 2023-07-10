part of 'pokemon_search_bloc.dart';

abstract class PokemonSearchEvent extends Equatable {
  const PokemonSearchEvent();
}

class SetSearchTermEvent extends PokemonSearchEvent {
  final String newSearchTerms;

  const SetSearchTermEvent({required this.newSearchTerms});

  @override
  List<Object> get props => [newSearchTerms];

  SetSearchTermEvent copyWith({String? newSearchTerms}) {
    return SetSearchTermEvent(
        newSearchTerms: newSearchTerms ?? this.newSearchTerms);
  }
}
