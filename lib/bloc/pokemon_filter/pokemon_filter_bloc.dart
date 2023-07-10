import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_filter_event.dart';
part 'pokemon_filter_state.dart';

class PokemonFilterBloc extends Bloc<PokemonFilterEvent, PokemonFilterState> {
  PokemonFilterBloc() : super(const PokemonFilterState(filter: [])) {
    on<ChangeFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });
  }
}
