import '/models/pokemon_model.dart';
import '/pages/home_page.dart';
import '/pages/pokemon_page.dart';
import 'package:go_router/go_router.dart';

class PokedexRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(title: "PokeFLutter"),
        routes: [
          GoRoute(
            path: 'pokemon',
            builder: (context, state) {
              PokemonModel pokemon = state.extra as PokemonModel;
              return PokemonPage(pokemon: pokemon);
            },
          )
        ],
      )
    ],
  );
}
