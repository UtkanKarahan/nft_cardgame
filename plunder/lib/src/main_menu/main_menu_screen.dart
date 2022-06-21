
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plunder/src/style/constants.dart';
import 'package:web3dart/web3dart.dart';
import 'package:plunder/src/cards/adventurer/adventurer.dart';
import 'package:plunder/src/cards/adventurer/adventurer_card.dart';
import 'package:plunder/src/metamask/metamask.dart';
import 'package:provider/provider.dart';
import '../contract_functions/contract_functions.dart';
import '../side_nav/navigation.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';


class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);


  _MainMenuScreenState createState() => _MainMenuScreenState();
}



class _MainMenuScreenState extends State<MainMenuScreen> {

  Client? httpClient;
  Web3Client? ethClient;


  @override
void initState()  {
    super.initState();
    httpClient = Client();
    ethClient = Web3Client(infura_url, httpClient!);
    getBalance(demoAdventurer.address, ethClient!);
    Future.delayed(const Duration(milliseconds: 500), () {

      setState(() {

      });

    });

  }

  Widget build(BuildContext context) {

    final palette = context.watch<Palette>();
    const gap = SizedBox(height: 60);
    return Scaffold(
      backgroundColor: palette.background,
      body: ResponsiveScreen(
        mainAreaProminence: 0.8,
        squarishMainArea: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            direction: Axis.horizontal,
            children:  [
              AdventurerCard(adventurer: demoAdventurer,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(


                    width: 800,
                    height: 150,
                    child: Card(
                      color: palette.sidePanel,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: const Center(
                        child:  Text(
                            'Adventurer Guild',
                            style: TextStyle(fontSize: 50, color: Colors.white),
                          ),
                      ),

                ),
                  ),
                  gap,
                  Container(


                    width: 800,
                    height: 150,
                    child: Card(
                      color: palette.sidePanel,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child:  Center(
                        child:  Text(
                          "Wallet Address:\n\n${demoAdventurer.address}",
                          style: const TextStyle(fontSize: 30, color: Colors.white),
                        ),
                  ),

                    ),
                  ),
                  gap,
                  Container(


                    width: 800,
                    height: 150,
                    child: Card(
                      color: palette.sidePanel,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child:  Center(
                        child:  Text(
                          "Crystal Amount:\n\n${demoAdventurer.crystal}",
                          style: const TextStyle(fontSize: 30, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ),
                  ),


                ],
              ),

            ],

          ),
        ),
        rectangularMenuArea: const SideNav(),
      ),
    );
  }
}
