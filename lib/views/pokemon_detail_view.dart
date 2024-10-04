import 'package:diario_pokemon/controllers/pokemon_detail_controller.dart';
import 'package:diario_pokemon/utils/pokemon_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonDetailView extends GetView<PokemonDetailController> {
  const PokemonDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Theme(
        data: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: PokemonColor.getColor(state!.color),
            dynamicSchemeVariant: DynamicSchemeVariant.content,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(state.name),
          ),
          body: ListView(
            children: [
              Image.network(
                state.imageUrl,
                filterQuality: FilterQuality.none,
                scale: 0.1,
              ),
              Card.filled(
                child: ListTile(
                  title: Text('Nº na pokedex: ${state.pokedexNumber}'),
                  subtitle: Text('Peso: ${state.weight}'),
                ),
              ),
              Card.filled(
                child: ListTile(
                  title: const Text('Habilidades'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      state.abilities.length,
                      (index) => Text(state.abilities[index]),
                    ),
                  ),
                ),
              ),
              Card.filled(
                child: ListTile(
                  title: const Text('Tipos'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      state.types.length,
                      (index) => Text(state.types[index]),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
