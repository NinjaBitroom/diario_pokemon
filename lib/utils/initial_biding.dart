import 'package:diario_pokemon/controllers/pokemon_list_controller.dart';
import 'package:diario_pokemon/services/poke_api_co_connect.dart';
import 'package:get/get.dart';

class InitialBiding extends Bindings {
  @override
  void dependencies() {
    Get.put(PokeApiCoConnect());
    Get.put(PokemonListController());
  }
}
