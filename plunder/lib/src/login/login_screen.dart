import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plunder/src/cards/adventurer/adventurer.dart';
import 'package:plunder/src/metamask/metamask.dart';
import 'package:provider/provider.dart';
import '../firestore/firestore.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    //context.read<FirestoreService>().addUser(MetaMaskProvider.currentAddress,MetaMaskProvider.currentAddress);

    return Scaffold(
      backgroundColor: palette.background,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
                child:  Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/MetaMask_Fox.svg/800px-MetaMask_Fox.svg.png",

                ),
                onPressed: () async {

                  await context.read<MetaMaskProvider>().connect();
                  demoAdventurer.address = MetaMaskProvider.currentAddress;
                  GoRouter.of(context).go("/guild");

                })
          ],
        ),
        rectangularMenuArea:  Column(),
      ),
    );
  }
}
