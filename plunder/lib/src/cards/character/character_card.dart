import 'package:flutter/material.dart';
import 'package:numerus/numerus.dart';
import 'package:plunder/src/cards/character/sell_button.dart';
import 'package:plunder/src/style/icons.dart';
import 'character.dart';



class CharacterCard extends StatefulWidget {
  final Character char;
  const CharacterCard({Key? key, required this.char}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CharacterCardState createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
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
                image: Image.network(widget.char.pic).image,
                fit: BoxFit.fill,
              ),
            ),

            child: Container(
              height: height,
              width: (height /8) *5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset("assets/cards/character_rank${widget.char.rarity}.png").image,
                  fit: BoxFit.fill,
                ),
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(39.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children:  [


                        Text("${widget.char.health.toRomanNumeralString()}", style: const TextStyle(fontSize: 70,color: Colors.black),),
                      ],



                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(39.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children:  [

                        Text("    ${widget.char.skill}", style: const TextStyle(fontSize: 70,color: Colors.black),),

                      ],



                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(39.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.char.race == "race1" ? Icon(MyFlutterApp.race1,size: 150,) : Icon(MyFlutterApp.race2,size: 150,),

                        Padding(
                          padding: const EdgeInsets.only(left:60.0),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: RichText(
                              text: TextSpan(
                                text: widget.char.name,
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
        SellButton(char: widget.char),
      ],
    );
  }
}
