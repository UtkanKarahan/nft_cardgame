import 'package:flutter/material.dart';
import 'package:numerus/numerus.dart';
import 'package:plunder/src/style/icons.dart';

import 'package:plunder/src/style/palette.dart';
import 'package:provider/provider.dart';

import '../hero/sell_button.dart';
import 'hero.dart' as her;

class HeroCard extends StatefulWidget {
  final her.Hero hero;
  const HeroCard({Key? key, required this.hero}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HeroCardState createState() => _HeroCardState();
}

class _HeroCardState extends State<HeroCard> {
  @override
  Widget build(BuildContext context) {
    double height = 1100;
    imageCache.clear();
    return Column(
      children: [
        Card(
          elevation: 21,
          child: Container(
            height: height,
            width: (height /8) *5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.network(widget.hero.pic).image,
                fit: BoxFit.fill,
              ),
            ),

            child: Container(
              height: height,
              width: (height /8) *5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset("assets/cards/hero_rank${widget.hero.rarity}.png").image,
                  fit: BoxFit.fill,
                ),
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(39.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children:  [

                        Text("${widget.hero.health.toRomanNumeralString()}", style: const TextStyle(fontSize: 70,color: Colors.black),),
                        Text("${widget.hero.attack.toRomanNumeralString()}", style: const TextStyle(fontSize: 70,color: Colors.black),),
                      ],



                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(39.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.hero.race == "race1" ? Icon(MyFlutterApp.race1,size: 150,) : Icon(MyFlutterApp.race2,size: 150,),

                        Padding(
                          padding: const EdgeInsets.only(left:60.0),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: RichText(
                              text: TextSpan(
                                text: widget.hero.name,
                                style: const TextStyle(fontSize: 45),

                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 100,),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 60,),
        SellButton(hero: widget.hero),
      ],
    );
  }
}
