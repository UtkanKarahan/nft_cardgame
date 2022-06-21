import 'package:flutter/material.dart';
import '../contract_functions/contract_functions.dart';
import '../style/constants.dart';
import '../style/palette.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class PackButton extends StatefulWidget {
  const PackButton({Key? key}) : super(key: key);

  @override
  _PackButtonState createState() => _PackButtonState();
}

class _PackButtonState extends State<PackButton> {
  Client? httpClient;
  Web3Client? ethClient;
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    return GestureDetector(
      onTap: () async {
        httpClient = Client();
        var ethClient = Web3Client(infura_url, httpClient!);


        await buyPack(ethClient);


      },
      child: Container(

        width: 1250,
        height: 150,
        child: Card(
          color: palette.sidePanel,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),

          child: const Center(
            child: Text(
              'Buy A Random Pack',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
        ),
      ),
    );

  }
}