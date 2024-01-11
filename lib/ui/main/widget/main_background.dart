import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MainBackgorund extends StatelessWidget {
  const MainBackgorund({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return const SizedBox(
          child: Stack(
            children: [
              RiveAnimation.asset('assets/rive/background.riv', fit: BoxFit.fill,),
            ],
          ),
        );
      },
    );
  }
}
