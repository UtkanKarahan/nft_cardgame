
class Character {
  int  health;
  String  name,  pic, rarity, description, race,skill;
  String address = "";
  String owner = "USER1";


  Character({
    required this.pic,
    required this.rarity,
    required this.name,
    required this.description,
    required this.health,
    required this.race,
    required this.skill

  });

}

Character demoCharacter = Character(rarity: "4",skill: "skill1", health: 10, race: "race2", description: "Test Character Card Demo", name: "Test Character",  pic: "https://m.media-amazon.com/images/M/MV5BMTEzNDYxNzMyMTZeQTJeQWpwZ15BbWU4MDQ4Njc1MjIy._V1_.jpg");