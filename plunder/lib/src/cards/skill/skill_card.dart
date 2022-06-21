import 'package:flutter/material.dart';
import 'package:numerus/numerus.dart';


import '../skill/sell_button.dart';
import 'skill.dart';

class SkillCard extends StatefulWidget {
  final Skill skill;
  const SkillCard({Key? key, required this.skill}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SkillCardState createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
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
                image: Image.network(widget.skill.pic,).image,
                fit: BoxFit.fill,
              ),
            ),

            child: Container(
              height: height,
              width: (height /8) *5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset("assets/cards/skill_rank${widget.skill.rarity}.png").image,
                  fit: BoxFit.fill,
                ),
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(70.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children:  [

                        SizedBox(height: 70,),
                        Text("${widget.skill.value.toRomanNumeralString()}", style: const TextStyle(fontSize: 70,color: Colors.black),),
                      ],



                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right:20.0),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: RichText(
                              text: TextSpan(
                                text: widget.skill.name,
                                style: const TextStyle(fontSize: 45),

                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 70,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 60,),
        SellButton(skill: widget.skill),
      ],
    );
  }
}
