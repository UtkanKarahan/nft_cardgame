import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../style/palette.dart';
import 'package:provider/provider.dart';



class NavButton extends StatefulWidget {

  String route;
  int ind;
  Icon pic;
   NavButton({Key? key, required this.pic, required this.route, required this.ind}) : super(key: key);

  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Container(
      height: 92,
      width: 92,
      color: selection[widget.ind] ? palette.background : Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(
            child: Padding(
              padding: const EdgeInsets.all(23.0),
              child: IconButton(
                icon: widget.pic,
                color: palette.ink,
                onPressed: ()
                {


                  GoRouter.of(context).go(widget.route);



                  },
              ),
            ),
          ),

        ],
      ),
    );
  }
  List<bool> selection = [true, false, false,false,false,];
}
