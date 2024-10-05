import 'package:diario_pokemon/models/pokemon_model.dart';
import 'package:diario_pokemon/utils/pokemon_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonDetailView extends GetView {
  final PokemonModel pokemon;
  const PokemonDetailView(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: PokemonColor.getColor(pokemon.color),
          dynamicSchemeVariant: DynamicSchemeVariant.content,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(pokemon.name),
        ),
        body: ListView(
          children: [
            Image.network(
              pokemon.imageUrl,
              filterQuality: FilterQuality.none,
              scale: 0.1,
            ),
            Card.filled(
              child: ListTile(
                title: Text('Nº na pokedex: ${pokemon.pokedexNumber}'),
                subtitle: Text('Peso: ${pokemon.weight}'),
              ),
            ),
            Card.filled(
              child: ListTile(
                title: const Text('Habilidades'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    pokemon.abilities.length,
                    (index) => Text(pokemon.abilities[index]),
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
                    pokemon.types.length,
                    (index) => Text(pokemon.types[index]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
