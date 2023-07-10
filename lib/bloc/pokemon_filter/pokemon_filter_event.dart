part of 'pokemon_filter_bloc.dart';

abstract class PokemonFilterEvent extends Equatable {
  const PokemonFilterEvent();
}

class ChangeFilterEvent extends PokemonFilterEvent {
  final List<String> newFilter;

  const ChangeFilterEvent({required this.newFilter});

  @override
  String toString() {
    return 'ChangeFilterEvent{newFilter: $newFilter}';
  }

  @override
  List<Object> get props => [newFilter];

  ChangeFilterEvent copyWith({List<String>? newFilter}) {
    return ChangeFilterEvent(newFilter: newFilter ?? this.newFilter);
  }
}
