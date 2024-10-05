import 'package:diario_pokemon/models/pokemon_response_model.dart';
import 'package:diario_pokemon/models/pokemon_result_response_model.dart';
import 'package:diario_pokemon/models/pokemon_species_response_model.dart';
import 'package:get/get.dart';

class PokeApiCoConnect extends GetConnect {
  Future<Response<List<PokemonResultResponseModel>>> getPokemons() {
    return get(
      'https://pokeapi.co/api/v2/pokemon',
      decoder: (data) => PokemonResultResponseModel.fromJsonList(
        data['results'],
      ),
    );
  }

  Future<Response<PokemonResponseModel>> getPokemon(String url) {
    return get(url, decoder: (data) => PokemonResponseModel.fromJson(data));
  }

  Future<Response<PokemonSpeciesResponseModel>> getPokemonSpecies(String url) {
    return get(
      url,
      decoder: (data) => PokemonSpeciesResponseModel.fromJson(data),
    );
  }
}
