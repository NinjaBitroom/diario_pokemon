class PokemonSpeciesResponseModel {
  final int pokedexNumber;
  final String color;

  PokemonSpeciesResponseModel(
      {required this.pokedexNumber, required this.color});

  factory PokemonSpeciesResponseModel.fromJson(Map<String, dynamic> json) {
    return PokemonSpeciesResponseModel(
      pokedexNumber: json['pokedex_numbers'][0]['entry_number'],
      color: json['color']['name'],
    );
  }
}
