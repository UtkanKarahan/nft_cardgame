import 'package:flutter/material.dart';
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
        squarishMainArea: Center(
          child: Transform.rotate(
            angle: -0.1,
            child: const Text(
              'OUZ Hani Sarki nerde',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Permanent Marker',
                fontSize: 55,
                height: 1,
              ),
            ),
          ),
        ),
        rectangularMenuArea: SideNav(),
      ),
    );
  }
}
