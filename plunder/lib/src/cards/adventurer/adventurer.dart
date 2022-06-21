

import 'package:flutter/material.dart';
import 'package:plunder/src/metamask/metamask.dart';

import '../pack/pack.dart';

class Adventurer {
  int win, lose, draw;
  String  username,  pic, rank;
  double  crystal = 0;
  String address = "";
  List<dynamic> pack_inventory = [];
  List<dynamic> card_inventory = [];


  Adventurer({
    required this.pic,
    required this.rank,
    required this.username,
    required this.draw,
    required this.lose,
    required this.win
  });

}

Adventurer demoAdventurer = Adventurer(rank: "2",win: 1, lose: 134, draw: 5, username: "Doomsday Paradise",  pic: "https://secure.img1-fg.wfcdn.com/im/02829071/resize-h800-w800%5Ecompr-r85/7726/77263230/Dark+Magician+Male+Yami+Yugi+Cardboard+Standup.jpg");