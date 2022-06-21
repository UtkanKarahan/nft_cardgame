import 'package:flutter/material.dart';
import 'package:plunder/src/side_nav/nav_button.dart';
import 'package:plunder/src/style/icons.dart';
import 'package:plunder/src/style/palette.dart';
import 'package:provider/provider.dart';





class SideNav extends StatefulWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  _SideNavState createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  @override
  Widget build(BuildContext context) {


    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        NavButton(pic: const Icon(MyFlutterApp.guild, size: 30,), route: "/guild"  ),
        NavButton(pic: const Icon(MyFlutterApp.shop, size: 30,), route: "/shop"),
        NavButton(pic: const Icon(Icons.all_inbox, size: 30,), route: "/inventory"),
        NavButton(pic: const Icon(MyFlutterApp.auction, size: 30,), route: "/auction"),
        NavButton(pic: const Icon(Icons.settings, size: 30,), route: "/settings"),




      ],
    );
  }

}
