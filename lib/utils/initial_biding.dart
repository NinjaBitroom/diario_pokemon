import 'package:diario_pokemon/controllers/pokemon_detail_controller.dart';
import 'package:diario_pokemon/controllers/pokemon_list_controller.dart';
import 'package:get/get.dart';

class InitialBiding extends Bindings {
  @override
  void dependencies() {
    Get.put(PokemonListController());
    Get.put(PokemonDetailController());
  }
}
