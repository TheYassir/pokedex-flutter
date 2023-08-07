import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_list/pokemon_list_bloc.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      decoration: const InputDecoration(
        icon: Icon(Icons.search),
        border: OutlineInputBorder(),
        labelText: 'Search',
      ),
      onChanged: (String? newSearchTerms) {
        if (newSearchTerms != null) {
          context
              .read<PokemonListBloc>()
              .add(LoadPokemonBySearch(searchTerm: newSearchTerms));
        }
      },
    ));
  }
}
