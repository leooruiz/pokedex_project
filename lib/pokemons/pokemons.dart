class Pokemon {
  String? name;
  Uri? image;
  int? id;

  Pokemon({
    required this.name,
    required this.image,
    required this.id,
  });

  Pokemon.fromMap(Map<String, dynamic> map) {
    String name = map['pokemon']['name'];
    Uri image = Uri.parse(map['sprites']['front_default']);
    int id = map['id'];
  }
}
