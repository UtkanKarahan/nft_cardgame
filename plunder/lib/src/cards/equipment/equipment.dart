
class Equipment {
  int attack, durability, health;
  String  name,  pic, rarity, description;
  String address = "";
  String owner = "USER1";

  Equipment({
    required this.pic,
    required this.rarity,
    required this.name,
    required this.description,
    required this.health,
    required this.durability,
    required this.attack
  });

}

Equipment demoEquipment = Equipment(rarity: "3",attack: 1, health: 11, durability: 5, description: "Test Equipment Card Demo", name: "Test Equipment",  pic: "https://media.istockphoto.com/photos/excalibur-the-mythical-sword-in-the-stone-of-king-arthur-picture-id1205395608");