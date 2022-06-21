
class Hero {
  int attack, health;
  String  name,  pic, rarity, description, race;
  String address = "";
  String owner = "USER1";

  Hero({
    required this.pic,
    required this.rarity,
    required this.name,
    required this.description,
    required this.health,
    required this.race,
    required this.attack
  });

}

Hero demoHero = Hero(rarity: "2",attack: 1, health: 10, race: "race1", description: "Test Hero Card Demo", name: "Test Hero",  pic: "https://m.media-amazon.com/images/M/MV5BMTEzNDYxNzMyMTZeQTJeQWpwZ15BbWU4MDQ4Njc1MjIy._V1_.jpg");