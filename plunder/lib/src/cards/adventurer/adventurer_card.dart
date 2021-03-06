import 'package:flutter/material.dart';
import 'package:plunder/src/cards/adventurer/adventurer.dart';
import 'package:plunder/src/style/palette.dart';
import 'package:provider/provider.dart';

class AdventurerCard extends StatefulWidget {
  final Adventurer adventurer;
  const AdventurerCard({Key? key, required this.adventurer}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AdventurerCardState createState() => _AdventurerCardState();
}

class _AdventurerCardState extends State<AdventurerCard> {
  @override
  Widget build(BuildContext context) {
    double height = 1100;
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
          height: height,
          width: (height /8) *5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset("assets/cards/adventurer_rank${widget.adventurer.rank}.png").image,
              fit: BoxFit.fill,
            ),
          ),
          child:Row(

            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Win / Lose / Draw", style: TextStyle(fontSize: 40,color: Colors.black) ,),
                    Text("${widget.adventurer.win} / ${widget.adventurer.lose} / ${widget.adventurer.draw}", style: const TextStyle(fontSize: 70,color: Colors.black),),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 160.0),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: RichText(
                    text: TextSpan(
                      text: widget.adventurer.username,
                      style: const TextStyle(fontSize: 45),

                    ),
                  ),
                ),
              ),
            ],
          ),
          ),
      ),
    );
  }
}
