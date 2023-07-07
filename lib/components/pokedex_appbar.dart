import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PokedexAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const PokedexAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.catching_pokemon),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
