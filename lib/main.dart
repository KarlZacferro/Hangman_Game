import 'package:flutter/material.dart';
import 'package:hungman_game/core/game.dart';
import 'package:hungman_game/ui/colors.dart';
import 'package:hungman_game/widget/figure_image.dart';

void main() {
  runApp(const Hangman());
}

class Hangman extends StatelessWidget {
  const Hangman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeColor.primaryColor,
      appBar: AppBar(
        title: const Text("Hangman"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppThemeColor.primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                //a utlização do widget figure
                figureImage(Game.tentativas >= 0, "assets/hang.png"),
                figureImage(Game.tentativas >= 1, "assets/head.png"),
                figureImage(Game.tentativas >= 2, "assets/body.png"),
                figureImage(Game.tentativas >= 3, "assets/ra.png"),
                figureImage(Game.tentativas >= 4, "assets/la.png"),
                figureImage(Game.tentativas >= 5, "assets/rl.png"),
                figureImage(Game.tentativas >= 6, "assets/ll.png"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
