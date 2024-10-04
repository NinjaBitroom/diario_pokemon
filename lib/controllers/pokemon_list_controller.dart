import 'dart:convert';

import 'package:diario_pokemon/models/pokemon_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PokemonListController extends GetxController
    with StateMixin<List<PokemonModel>> {
  @override
  Future<void> onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());
    final url = Uri.https('pokeapi.co', '/api/v2/pokemon');
    final response = await http.get(url);
    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));
    final pokemons = <PokemonModel>[];
    for (final r in responseBody["results"]) {
      final pokemonUrl = Uri.parse(r['url']);
      final pokemonResponse = await http.get(pokemonUrl);
      final pokemonResponseBody =
          jsonDecode(utf8.decode(pokemonResponse.bodyBytes));

      final speciesUrl = Uri.parse(pokemonResponseBody['species']['url']);
      final speciesResponse = await http.get(speciesUrl);
      final speciesResponseBody =
          jsonDecode(utf8.decode(speciesResponse.bodyBytes));

      final pokemonTypes = <String>[];
      for (final type in pokemonResponseBody['types']) {
        pokemonTypes.add(type['type']['name']);
      }

      final pokemonAbilities = <String>[];
      for (final type in pokemonResponseBody['abilities']) {
        pokemonAbilities.add(type['ability']['name']);
      }

      pokemons.add(PokemonModel(
        name: r['name'],
        pokedexNumber: speciesResponseBody['pokedex_numbers'][0]
            ['entry_number'],
        imageUrl: pokemonResponseBody['sprites']['front_default'],
        types: pokemonTypes,
        abilities: pokemonAbilities,
        weight: pokemonResponseBody['weight'],
      ));
    }
    change(pokemons, status: RxStatus.success());
  }
}
