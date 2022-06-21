import 'package:flutter/material.dart';

import 'package:plunder/src/cards/pack/sell_button.dart';

import 'pack.dart';



class PackCard extends StatefulWidget {
  final Pack pack;
  const PackCard({Key? key, required this.pack}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PackCardState createState() => _PackCardState();
}

class _PackCardState extends State<PackCard> {
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
                image: Image.network(widget.pack.pic).image,
                fit: BoxFit.fill,
              ),
            ),


          ),
        ),
        const SizedBox(height: 60,),
        SellButton(pack: widget.pack),
      ],
    );
  }
}
