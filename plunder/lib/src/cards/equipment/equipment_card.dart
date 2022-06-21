import 'package:flutter/material.dart';
import 'package:numerus/numerus.dart';

import 'package:plunder/src/style/palette.dart';
import 'package:provider/provider.dart';

import '../equipment/sell_button.dart';
import 'equipment.dart';

class EquipmentCard extends StatefulWidget {
  final Equipment equipment;
  const EquipmentCard({Key? key, required this.equipment}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EquipmentCardState createState() => _EquipmentCardState();
}

class _EquipmentCardState extends State<EquipmentCard> {
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
                image: Image.network(widget.equipment.pic,).image,
                fit: BoxFit.fill,
              ),
            ),

            child: Container(
              height: height,
              width: (height /8) *5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset("assets/cards/equipment_rank${widget.equipment.rarity}.png").image,
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

                        Text("${widget.equipment.durability.toRomanNumeralString()}", style: const TextStyle(fontSize: 70,color: Colors.black),),
                        Text("${widget.equipment.attack.toRomanNumeralString()}", style: const TextStyle(fontSize: 70,color: Colors.black),),
                      ],



                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(39.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 10,),
                        RotatedBox(
                          quarterTurns: 1,
                          child: RichText(
                            text: TextSpan(
                              text: widget.equipment.name,
                              style: const TextStyle(fontSize: 45),

                            ),
                          ),
                        ),
                        Text("${widget.equipment.health.toRomanNumeralString()}", style: const TextStyle(fontSize: 70,color: Colors.black),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 60,),
        SellButton(equipment: widget.equipment),
      ],
    );
  }
}
