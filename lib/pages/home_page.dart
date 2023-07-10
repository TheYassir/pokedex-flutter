import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:pokemon/models/select_data.dart';
import '../bloc/blocs.dart';
import 'package:pokemon/widgets/home_pokemons_widget.dart';
import 'package:pokemon/widgets/home_search_widget.dart';
import 'package:pokemon/widgets/home_title_widget.dart';
import '../components/pokedex_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PokedexAppBar(title: "Pokedex Flutter"),
        body: BlocBuilder<PokemonListBloc, PokemonListState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return LayoutBuilder(
                builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            HomeTitle(),
                            HomeSearch(),
                            SizedBox(height: 10),
                            HomePokemons(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        drawer: Drawer(
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
            MultiSelectFormField(
                // chipBackGroundColor: Colors.red,
                chipLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
                dialogTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                // checkBoxActiveColor: Colors.red,
                // checkBoxCheckColor: Colors.green,
                dataSource: selectdata,
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
                  List<String> strArray =
                      (value as List).map((item) => item as String).toList();
                  print(strArray);

                  context
                      .read<PokemonFilterBloc>()
                      .add(ChangeFilterEvent(newFilter: strArray));
                  // List<String> strArray =
                  //     (value as List).map((item) => item as String).toList();

                  // BlocProvider(
                  //   create: (context) {
                  //     HomeBloc homeBloc = HomeBloc(selectedFilters: strArray);
                  //     homeBloc.add(HomeFilterPokemonsEvent());
                  //     return homeBloc;
                  //   },
                  // );
                  // HomeBloc(selectedFilters: strArray)
                  //     .add(HomeLoadPokemonsEvent());

                  // Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   child: ElevatedButton.icon(
                  //       onPressed: () => {},
                  //       icon: const Icon(Icons.search),
                  //       label: const Text('CHERCHER UN VÉHICULE'),
                  //       style: ElevatedButton.styleFrom(
                  //         minimumSize: const Size.fromHeight(64),
                  //       )),
                  // );
                })
          ]),
        ));
  }
}
