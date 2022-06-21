import 'package:flutter/material.dart';
import '../../style/palette.dart';
import 'package:provider/provider.dart';
import 'hero.dart' as her;

class SellButton extends StatefulWidget {
  final her.Hero hero;
  SellButton({required this.hero, Key? key}) : super(key: key);

  @override
  _SellButtonState createState() => _SellButtonState();
}

class _SellButtonState extends State<SellButton> {
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    return GestureDetector(
      onTap: (){


      },
      child: SizedBox(

        width: 300,
        height: 150,
        child: Card(
          color: palette.sidePanel,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),

          child:  const Center(
            child: Text(
              'Sell Card',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
      ),
    );

  }
}