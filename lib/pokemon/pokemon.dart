class Pokemon {
  final String name;
  final String cardImage;
  final int id;
  final String type1;
  final String? type2;
  final String detailsImage;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  final int weight;
  final int height;
  final String move1;
  final String? move2;

  Pokemon({
    required this.name,
    required this.cardImage,
    required this.id,
    required this.type1,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.weight,
    required this.height,
    required this.detailsImage,
    required this.move1,
    required this.move2,
    this.type2,
  });

  factory Pokemon.fromMap(Map<String, dynamic> mainMap) {
    List<dynamic> typeList = mainMap['types'];
    List<dynamic> mainMovesList = mainMap['moves'];
    return Pokemon(
      name: mainMap['name'],
      id: mainMap['id'],
      cardImage: mainMap['sprites']['other']['home']['front_default'],
      detailsImage: mainMap['sprites']['other']['official-artwork']
          ['front_default'],
      type1: mainMap['types'][0]['type']['name'],
      type2: typeList.length == 1 ? null : mainMap['types'][1]['type']['name'],
      hp: mainMap['stats'][0]['base_stat'],
      attack: mainMap['stats'][1]['base_stat'],
      defense: mainMap['stats'][2]['base_stat'],
      specialAttack: mainMap['stats'][3]['base_stat'],
      specialDefense: mainMap['stats'][4]['base_stat'],
      speed: mainMap['stats'][5]['base_stat'],
      weight: mainMap['weight'],
      height: mainMap['height'],
      move1: mainMap['moves'][0]['move']['name'],
      move2: mainMovesList.length == 1
          ? null
          : mainMap['moves'][1]['move']['name'],
    );
  }

  @override
  String toString() =>
      'Pokemon(name: $name, image: $cardImage, id: $id, type 1: $type1, type 2: $type1, bigImage: $detailsImage)';
}
