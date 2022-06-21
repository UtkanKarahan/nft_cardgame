import 'package:flutter/material.dart';
import '../style/palette.dart';
import 'package:provider/provider.dart';


class RemoveButton extends StatefulWidget {

  RemoveButton({ Key? key}) : super(key: key);

  @override
  _RemoveButtonState createState() => _RemoveButtonState();
}

class _RemoveButtonState extends State<RemoveButton> {
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    return GestureDetector(
      onTap: (){},
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
              'Remove Card From Sale',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
      ),
    );

  }
}