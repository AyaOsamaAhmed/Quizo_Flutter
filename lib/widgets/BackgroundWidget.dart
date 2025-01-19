import '../Utilities/theme_helper.dart';
import 'package:flutter/material.dart';

import '../generated/assets.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  final double opacity;
  const BackgroundWidget({super.key, required this.child, this.opacity = 0.0,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(gradient: ThemeClass.backgroundGradiant,),
          child: Image.asset(
            Assets.splash,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            opacity: AlwaysStoppedAnimation(opacity),
          ),
        ),
        Positioned.fill(
          child: Opacity(
            opacity: opacity,
            child: Container(
              decoration: const BoxDecoration(gradient: ThemeClass.backgroundGradiant,),
            ),
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}
