import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plunder/src/cards/adventurer/adventurer.dart';
import 'package:plunder/src/metamask/metamask.dart';
import 'package:provider/provider.dart';
import '../cards/character/character.dart';
import '../cards/character/character_card.dart';
import '../cards/equipment/equipment.dart';
import '../cards/equipment/equipment_card.dart';
import '../cards/hero/hero.dart';
import '../cards/hero/hero_card.dart';
import '../cards/skill/skill.dart';
import '../cards/skill/skill_card.dart';
import '../firestore/firestore.dart';
import '../side_nav/navigation.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';


class AuctionScreen extends StatelessWidget {
  const AuctionScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    List<Widget> demoAuction = [CharacterCard(char: demoCharacter), HeroCard(hero: demoHero), EquipmentCard(equipment: demoEquipment), SkillCard(skill: demoSkill)];

    return Scaffold(
      backgroundColor: palette.background,
      body: ResponsiveScreen(
        mainAreaProminence: 0.8,
        squarishMainArea: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 1200,
                childAspectRatio: 1,
                crossAxisSpacing: 60,
                mainAxisSpacing: 60),
            itemCount: demoAuction.length,
            itemBuilder: (BuildContext ctx, index) {
              return FittedBox(
                  alignment: Alignment.center,
                  child: demoAuction[index]
              );
            }),
        rectangularMenuArea: const SideNav(),
      ),
    );
  }
}