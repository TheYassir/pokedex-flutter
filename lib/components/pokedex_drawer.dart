import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

Drawer pokedexDrawer(BuildContext context) {
  return Drawer(
    child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Text(
          'Pokedex Flutter',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: const Color.fromRGBO(0, 104, 114, 1)),
        ),
      ),
      ListTile(
        title: TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.search),
            border: OutlineInputBorder(),
            labelText: 'Search',
          ),
        ),
      ),
      MultiSelectFormField(
          // chipBackGroundColor: Colors.red,
          chipLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          dialogTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          // checkBoxActiveColor: Colors.red,
          // checkBoxCheckColor: Colors.green,
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
          hintWidget: const Text('Please choose one or more'),
          onSaved: (value) {
            if (value == null) return;
            // setState(() {
            //   _myActivities = value;
            // });
            // BlocProvider(create: (context) {
            //   // Crée le HomeBloc
            //   HomeBloc homeBloc = HomeBloc(selectedFilters: value);
            //   homeBloc.add(HomeFilterPokemonsEvent());
            //   return homeBloc;
            // });
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                  onPressed: () => {},
                  icon: const Icon(Icons.search),
                  label: const Text('CHERCHER UN VÉHICULE'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(64),
                  )),
            );
          })
    ]),
  );
}
