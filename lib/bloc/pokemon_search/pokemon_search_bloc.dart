import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'pokemon_search_event.dart';
part 'pokemon_search_state.dart';

class PokemonSearchBloc extends Bloc<PokemonSearchEvent, PokemonSearchState> {
  PokemonSearchBloc() : super(const PokemonSearchState(searchTerm: '')) {
    on<SetSearchTermEvent>(
      (event, emit) {
        emit(state.copyWith(searchTerm: event.newSearchTerms));
      },
    );
  }

  EventTransformer<SetSearchTermEvent> debounce<SetSearchTermEvent>(
      Duration duration) {
    return (event, mapper) => event.debounceTime(duration).flatMap(mapper);
  }
}
