import 'package:flutter/material.dart';
import 'package:plunder/src/cards/adventurer/adventurer.dart';
import 'package:plunder/src/cards/adventurer/adventurer_card.dart';
import 'package:provider/provider.dart';
import '../side_nav/navigation.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();


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
