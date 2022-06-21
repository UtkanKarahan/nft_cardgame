import 'package:flutter/material.dart';
import 'package:plunder/src/contract_functions/contract_functions.dart';
import '../../style/constants.dart';
import '../../style/palette.dart';
import 'package:provider/provider.dart';
import 'pack.dart';
import 'package:web3dart/web3dart.dart';

import 'package:http/http.dart';

class SellButton extends StatefulWidget {
  final Pack pack;
  SellButton({required this.pack, Key? key}) : super(key: key);

  @override
  _SellButtonState createState() => _SellButtonState();
}

class _SellButtonState extends State<SellButton> {

  Client? httpClient;
  Web3Client? ethClient;

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    return GestureDetector(
      onTap: () async {

        httpClient = Client();
        ethClient = Web3Client(infura_url, httpClient!);
        await openPack(widget.pack, ethClient!);

        Future.delayed(const Duration(seconds: 2), () {

          setState(() {

          });

        });


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
              'Open Pack',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
      ),
    );

  }
}