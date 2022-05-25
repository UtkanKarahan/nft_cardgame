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
        squarishMainArea: Wrap(
          children:  [
            AdventurerCard(adventurer: demoAdventurer,),

          ],

        ),
        rectangularMenuArea: SideNav(),
      ),
    );
  }
}
