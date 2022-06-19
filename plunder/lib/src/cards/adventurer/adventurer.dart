

class Adventurer {
  int win, lose, draw;
  String  username, tag, pic, rank;
  double  crystal;

  Adventurer({
    required this.pic,
    required this.rank,
    required this.username,
    required this.crystal,
    required this.draw,
    required this.lose,
    required this.tag,
    required this.win
  });

}

Adventurer demoAdventurer = Adventurer(rank: "2",win: 1, lose: 134, draw: 5, crystal: 140, username: "Nostradamus", tag: "34239", pic: "https://secure.img1-fg.wfcdn.com/im/02829071/resize-h800-w800%5Ecompr-r85/7726/77263230/Dark+Magician+Male+Yami+Yugi+Cardboard+Standup.jpg");