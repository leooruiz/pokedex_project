class Pokemon {
  final String? name;
  final Uri? image;
  final int? id;

  Pokemon({
    required this.name,
    required this.image,
    required this.id,
  });

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
        name: map['name'],
        image: Uri.parse(map['sprites']['front_default']),
        id: map['id']);
  }

  Pokemon fromMap(Map<String, dynamic> map) {
    return Pokemon(
        name: map['name'],
        image: Uri.parse(map['sprites']['front_default']),
        id: map['id']);
  }

  Pokemon.fromMap1(Map<String, dynamic> map)
      : //

        name = map['name'],
        image = Uri.parse(map['sprites']['front_default']),
        id = map['id'];

  @override
  String toString() => 'Pokemon(name: $name, image: $image, id: $id)';
}
