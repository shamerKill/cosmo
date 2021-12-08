import 'dart:math';

import 'package:flutter/material.dart';

class LAnimationView extends StatelessWidget {
  const LAnimationView({
    Key? key,
    required this.child,
    this.randomKey = true,
  }) : super(key: key);
  final Widget child;
  final bool randomKey;

  @override
  Widget build(BuildContext context) {
    Key _key = randomKey ? Key('animation_${Random().nextInt(1000)}') : Key('animation_${child.toString()}');
    return AnimatedSwitcher(
      transitionBuilder: (child, anim){
        return FadeTransition(child: child, opacity: anim);
      },
      duration: const Duration(milliseconds: 200),
      child: Container(
        key: _key,
        child: child,
      ),
    );
  }
}