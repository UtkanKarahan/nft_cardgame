import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../style/palette.dart';
import 'package:provider/provider.dart';
import 'package:plunder/src/side_nav/navigation.dart';



class NavButton extends StatefulWidget {

  String route;
  Icon pic;

   NavButton({Key? key, required this.pic, required this.route,}) : super(key: key);

  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    // ignore: sized_box_for_whitespace
    return Container(
      height: 60,
      width: 60,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.all(7.0),
            child: IconButton(
              icon: widget.pic,
              color: palette.ink,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onPressed: ()
              {
                GoRouter.of(context).go(widget.route);

                },
            ),
          ),

        ],
      ),
    );
  }

}
