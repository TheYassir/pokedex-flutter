class PokemonModel {
  int id;
  String name;
  String img;
  String imgshiny;
  int weight;
  int height;
  dynamic types;
  dynamic stats;
  dynamic species;
  dynamic evolution;

  PokemonModel({
    required this.id,
    required this.name,
    required this.img,
    required this.imgshiny,
    required this.weight,
    required this.height,
    required this.types,
    required this.stats,
    required this.species,
    required this.evolution,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      img: json['img'],
      imgshiny: json['imgshiny'],
      weight: json['weight'],
      height: json['height'],
      types: json['types'],
      stats: json['stats'],
      species: json['species'],
      evolution: json['evolution'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'img': img,
        'imgshiny': imgshiny,
        'weight': weight,
        'height': height,
        'types': types,
        'stats': stats,
        'species': species,
        'evolution': evolution,
      };
}
