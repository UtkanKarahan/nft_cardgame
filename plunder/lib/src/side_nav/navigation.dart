import 'package:flutter/material.dart';
import 'package:plunder/src/side_nav/nav_button.dart';




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

        NavButton(pic: const Icon(Icons.add, size: 46,), route: "/", ind: 0),
        NavButton(pic: const Icon(Icons.shopping_cart, size: 46,), route: "/",ind: 1 ),
        NavButton(pic: const Icon(Icons.sell, size: 46,), route: "/", ind: 2),
        NavButton(pic: const Icon(Icons.signal_wifi_off_rounded, size: 46,), route: "/", ind :3),
        NavButton(pic: const Icon(Icons.settings, size: 46,), route: "/settings", ind: 4),



      ],
    );
  }

}
