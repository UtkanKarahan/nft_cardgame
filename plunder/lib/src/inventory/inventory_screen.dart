import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plunder/src/cards/character/character.dart';
import 'package:plunder/src/cards/character/character_card.dart';
import 'package:plunder/src/cards/adventurer/adventurer.dart';
import 'package:plunder/src/cards/equipment/equipment.dart';
import 'package:plunder/src/cards/equipment/equipment_card.dart';
import 'package:plunder/src/cards/pack/pack_card.dart';
import 'package:plunder/src/metamask/metamask.dart';
import 'package:provider/provider.dart';
import '../cards/hero/hero.dart';
import '../cards/hero/hero_card.dart';
import '../cards/pack/pack.dart';
import '../cards/skill/skill.dart';
import '../cards/skill/skill_card.dart';
import '../firestore/firestore.dart';
import '../side_nav/navigation.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';


class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    //List<Widget> demoInventory = [PackCard(pack: demoPack),CharacterCard(char: demoCharacter), HeroCard(hero: demoHero), EquipmentCard(equipment: demoEquipment), SkillCard(skill: demoSkill)];
    List demoInventory = demoAdventurer.pack_inventory + demoAdventurer.card_inventory;
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
            itemCount: demoInventory.length,
            itemBuilder: (BuildContext ctx, index) {
              return FittedBox(
                alignment: Alignment.center,
                child: demoInventory[index]
              );
            }),
        rectangularMenuArea: const SideNav(),
      ),
    );
  }
}