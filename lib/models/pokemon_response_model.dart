class PokemonResponseModel {
  final String speciesUrl;
  final List<String> types;
  final List<String> abilities;
  final String imageUrl;
  final int weight;

  PokemonResponseModel({
    required this.speciesUrl,
    required this.types,
    required this.abilities,
    required this.imageUrl,
    required this.weight,
  });

  factory PokemonResponseModel.fromJson(Map<String, dynamic> json) {
    final pokemonTypes = <String>[];
    for (final type in json['types']) {
      pokemonTypes.add(type['type']['name']);
    }
    final pokemonAbilities = <String>[];
    for (final type in json['abilities']) {
      pokemonAbilities.add(type['ability']['name']);
    }
    return PokemonResponseModel(
      speciesUrl: json['species']['url'],
      types: pokemonTypes,
      abilities: pokemonAbilities,
      imageUrl: json['sprites']['front_default'],
      weight: json['weight'],
    );
  }
}
