import 'package:diario_pokemon/app.dart';
import 'package:diario_pokemon/controllers/pokemon_list_controller.dart';
import 'package:diario_pokemon/controllers/pokemon_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(PokemonListController());
  Get.put(PokemonDetailController());
  runApp(const App());
}
