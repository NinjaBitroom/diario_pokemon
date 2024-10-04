class PokemonModel {
  final String name;
  final int pokedexNumber;
  final String imageUrl;
  final List<String> types;
  final List<String> abilities;
  final int weight;
  final String color;

  PokemonModel({
    required this.name,
    required this.pokedexNumber,
    required this.imageUrl,
    required this.types,
    required this.abilities,
    required this.weight,
    required this.color,
  });
}
