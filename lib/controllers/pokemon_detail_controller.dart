import 'package:diario_pokemon/models/pokemon_model.dart';
import 'package:get/get.dart';

class PokemonDetailController extends GetxController with StateMixin<PokemonModel> {
  void updatepokemon(PokemonModel pokemon) {
    change(pokemon, status: RxStatus.success());
  }
}