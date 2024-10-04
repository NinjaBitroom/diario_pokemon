import 'package:diario_pokemon/controllers/pokemon_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonDetailView extends GetView<PokemonDetailController> {
  const PokemonDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => FutureBuilder(
        builder: (context, snapshot) {
          return Theme(
            data: ThemeData.from(colorScheme: snapshot.data!),
            child: Builder(builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(state.name),
                ),
                body: ListView(
                  children: [
                    Card.filled(
                      child: ListTile(
                        leading: Image.network(state.imageUrl),
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
              );
            }),
          );
        },
        initialData: context.theme.colorScheme,
        future: ColorScheme.fromImageProvider(
          provider: NetworkImage(state!.imageUrl),
          dynamicSchemeVariant: DynamicSchemeVariant.content,
        ),
      ),
    );
  }
}
