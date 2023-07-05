import 'package:flutter/material.dart';
import 'pages/home_page.dart';

// Fonction principale pour lancer l'application
void main() {
  // L'application lue se nomme MyApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PokeFLutter",
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.grey,
      ),
      // La page d'accueil de l'application
      home: const HomePage(title: "PokeFLutter"),
    );
  }
}
