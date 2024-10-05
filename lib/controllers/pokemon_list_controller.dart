import 'package:diario_pokemon/models/pokemon_model.dart';
import 'package:diario_pokemon/services/poke_api_co_connect.dart';
import 'package:get/get.dart';

class PokemonListController extends GetxController
    with StateMixin<List<PokemonModel>> {
  final _pokeApiCoConnect = Get.find<PokeApiCoConnect>();

  @override
  Future<void> onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());

    final response = await _pokeApiCoConnect.getPokemons();
    final pokemons = <PokemonModel>[];

    for (final r in response.body!) {
      final pokemonResponse = await _pokeApiCoConnect.getPokemon(r.url);
      final speciesResponse = await _pokeApiCoConnect.getPokemonSpecies(
        pokemonResponse.body!.speciesUrl,
      );

      pokemons.add(PokemonModel(
        name: r.name,
        pokedexNumber: speciesResponse.body!.pokedexNumber,
        imageUrl: pokemonResponse.body!.imageUrl,
        types: pokemonResponse.body!.types,
        abilities: pokemonResponse.body!.abilities,
        weight: pokemonResponse.body!.weight,
        color: speciesResponse.body!.color,
      ));
    }
    change(pokemons, status: RxStatus.success());
  }
}
