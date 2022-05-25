import 'package:flutter/material.dart';
import 'package:plunder/src/cards/adventurer/adventurer.dart';
import 'package:plunder/src/style/palette.dart';
import 'package:provider/provider.dart';

class AdventurerCard extends StatefulWidget {
  final Adventurer adventurer;
  const AdventurerCard({Key? key, required this.adventurer}) : super(key: key);

  @override
  _AdventurerCardState createState() => _AdventurerCardState();
}

class _AdventurerCardState extends State<AdventurerCard> {
  @override
  Widget build(BuildContext context) {
    double height = 1200;
    imageCache.clear();
    return Card(
      elevation: 21,
      child: Container(
        height: height,
        width: (height /8) *5,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network(widget.adventurer.pic,).image,
            fit: BoxFit.fill,
          ),
        ),

        child: Container(

          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset("assets/cards/adventurer_rank${widget.adventurer.rank}.png").image,
              fit: BoxFit.scaleDown,
            ),
          ),
          child:Column(),
          ),
      ),
    );
  }
}
