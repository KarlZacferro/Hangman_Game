import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hungman_game/core/game.dart';
import 'package:hungman_game/screens/game_screen.dart';
import 'package:hungman_game/ui/colors.dart';
import 'package:hungman_game/widget/figure_image.dart';
import 'package:hungman_game/widget/keyboard.dart';

void main() {
  runApp(const Hangman());
}

class Hangman extends StatelessWidget {
  const Hangman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameScreen(),
    );
  }
}
