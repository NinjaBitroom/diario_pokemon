import 'package:diario_pokemon/utils/app_theme.dart';
import 'package:diario_pokemon/utils/initial_biding.dart';
import 'package:diario_pokemon/views/pokemon_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.defaultLightTheme,
      darkTheme: AppTheme.defaultDarkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBiding(),
      home: const PokemonListView(),
    );
  }
}
