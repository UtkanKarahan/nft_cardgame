import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plunder/src/shop/pack_button.dart';

import 'package:provider/provider.dart';
import '../firestore/firestore.dart';
import '../side_nav/navigation.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';
import 'buy_currency_button.dart';


class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();


    return Scaffold(
      backgroundColor: palette.background,
      body: ResponsiveScreen(
        mainAreaProminence: 0.8,
        squarishMainArea: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children:  [
              const PackButton(),
              const SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CurrencyButton(amount:5),
                  CurrencyButton(amount:10),
                  CurrencyButton(amount:25),
                ],
              ),
              const SizedBox(height: 60,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CurrencyButton(amount:50),
                  CurrencyButton(amount:100),
                  CurrencyButton(amount:200),
                ],
              )
            ],
          ),
        ),
        rectangularMenuArea: SideNav(),
      ),
    );
  }
}