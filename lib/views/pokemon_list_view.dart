import 'package:diario_pokemon/controllers/pokemon_list_controller.dart';
import 'package:diario_pokemon/controllers/pokemon_detail_controller.dart';
import 'package:diario_pokemon/views/pokemon_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonListView extends GetView<PokemonListController> {
  const PokemonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diário de Pokemon'),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: state?.length,
          itemBuilder: (BuildContext context, int index) => Card.filled(
            child: ListTile(
              leading: Image.network(state![index].imageUrl),
              title: Text(state[index].name),
              subtitle: Text('Nº na pokedex: ${state[index].pokedexNumber}'),
              onTap: () {
                Get.to(() {
                  final pokemonDetailController = Get.find<PokemonDetailController>();
                  pokemonDetailController.updatepokemon(state[index]);
                  return const PokemonDetailView();
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
