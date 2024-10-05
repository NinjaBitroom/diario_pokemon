class PokemonResultResponseModel {
  final String name;
  final String url;

  PokemonResultResponseModel({required this.name, required this.url});

  factory PokemonResultResponseModel.fromJson(Map<String, dynamic> json) {
    return PokemonResultResponseModel(
      name: json['name'],
      url: json['url'],
    );
  }

  static List<PokemonResultResponseModel> fromJsonList(List<dynamic> jsonList) {
    return List.from(
      jsonList.map((json) => PokemonResultResponseModel.fromJson(json)),
    );
  }
}
