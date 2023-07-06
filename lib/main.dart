import 'package:flutter/material.dart';
import 'routing/pokedex_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "PokeFLutter",
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.grey,
      ),
      routerConfig: PokedexRouter.router,
    );
  }
}
