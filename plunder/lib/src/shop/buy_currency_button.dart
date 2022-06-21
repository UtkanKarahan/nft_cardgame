import 'package:flutter/material.dart';
import 'package:plunder/src/cards/adventurer/adventurer.dart';
import 'package:plunder/src/contract_functions/contract_functions.dart';
import '../style/constants.dart';
import '../style/palette.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';


class CurrencyButton extends StatefulWidget {
  int amount;
  CurrencyButton({required this.amount, Key? key}) : super(key: key);

  @override
  _CurrencyButtonState createState() => _CurrencyButtonState();
}

class _CurrencyButtonState extends State<CurrencyButton> {

  Client? httpClient;
  Web3Client? ethClient;
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    return GestureDetector(
      onTap: () async {
        httpClient = Client();
        var ethClient = Web3Client(infura_url, httpClient!);


        await buyCrystal(BigInt.from(widget.amount), ethClient);

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

          child:  Center(
            child: Text(
              'Buy ${widget.amount} Crystal',
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
      ),
    );

  }
}