import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hungman_game/core/game.dart';
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
  String word = "Flutter";

  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
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
          ),
          SizedBox(
            height: 20,
          ),
          //Creating the hidden word widget interacting with the game class
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word
                .split("")
                .map((e) => Keyboard(e.toUpperCase(),
                    !Game.selectedChar.contains(e.toUpperCase())))
                .toList(),
          ),
          //keybord
          SizedBox(
            width: double.infinity,
            height: 250.0,
            child: GridView.count(
              crossAxisCount: 7,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(8.0),
              children: alphabets.map((e) {
                return RawMaterialButton(
                  onPressed: Game.selectedChar.contains(e)
                      ? null //checking if the button was selected before
                      : () {
                          setState(() {
                            Game.selectedChar.add(e);
                            print(Game.selectedChar);
                            if (!word.split('').contains(e.toUpperCase())) {
                              Game.tentativas++;
                            }
                          });
                        },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  fillColor: Game.selectedChar.contains(e)
                      ? Colors.black87
                      : AppThemeColor.primaryColorDark,
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
