
class Skill {
  int value;
  String  name,  pic, rarity, description;
  String address = "";
  bool atk_heal;
  String owner = "USER2";



  Skill({
    required this.pic,
    required this.rarity,
    required this.name,
    required this.description,
    required this.value,
    required this.atk_heal,
  });

}

Skill demoSkill = Skill(rarity: "2", value: 12, atk_heal: true, description: "Test Skill Card Demo", name: "Test Skill Card",  pic: "https://media.istockphoto.com/vectors/fire-emoji-icon-vector-id1328395235?k=20&m=1328395235&s=612x612&w=0&h=7Hq6dqL9f9kZgprjGWK1cswTyqoUEMtXgIN7eYDSpO0=");