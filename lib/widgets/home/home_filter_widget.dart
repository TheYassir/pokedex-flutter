import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:pokemon/bloc/blocs.dart';

class HomeFilter extends StatelessWidget {
  const HomeFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiSelectFormField(
        chipBackGroundColor: Theme.of(context).primaryColor,
        chipLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        dialogTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        checkBoxActiveColor: Theme.of(context).primaryColor,
        checkBoxCheckColor: Colors.white,
        dataSource: const [
          {
            "display": "Grass",
            "value": "grass",
          },
          {
            "display": "Fire",
            "value": "fire",
          },
          {
            "display": "Water",
            "value": "water",
          },
          {
            "display": "Bug",
            "value": "bug",
          },
          {
            "display": "Normal",
            "value": "normal",
          },
          {
            "display": "Poison",
            "value": "poison",
          },
          {
            "display": "Electric",
            "value": "electric",
          },
          {
            "display": "Ground",
            "value": "ground",
          },
          {
            "display": "Fairy",
            "value": "fairy",
          },
          {
            "display": "Fighting",
            "value": "fighting",
          },
          {
            "display": "Psychic",
            "value": "psychic",
          },
          {
            "display": "Rock",
            "value": "rock",
          },
          {
            "display": "Ghost",
            "value": "ghost",
          },
          {
            "display": "Ice",
            "value": "ice",
          },
          {
            "display": "Dragon",
            "value": "dragon",
          },
          {
            "display": "Flying",
            "value": "flying",
          },
          {
            "display": "Dark",
            "value": "dark",
          },
          {
            "display": "Steel",
            "value": "steel",
          },
        ],
        dialogShapeBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        title: const Text(
          "Filter by type",
          style: TextStyle(fontSize: 16),
        ),
        textField: 'display',
        valueField: 'value',
        okButtonLabel: 'OK',
        cancelButtonLabel: 'CANCEL',
        hintWidget: const Text('Tap to select filter'),
        onSaved: (value) {
          List<String> strArray =
              (value as List).map((item) => item as String).toList();

          context
              .read<PokemonFilterBloc>()
              .add(ChangeFilterEvent(newFilter: strArray));
        });
  }
}
