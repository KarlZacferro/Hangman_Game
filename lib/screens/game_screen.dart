import 'package:flutter/material.dart';
import 'package:hungman_game/core/words.dart';
import '../core/game.dart';
import '../core/words.dart';
import '../ui/colors.dart';
import '../widget/figure_image.dart';
import '../widget/keyboard.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => __GameScreenState();
}

class __GameScreenState extends State<GameScreen> {
//teste
  int score = 0;
  final game = Game();

  String word = wordlist[Random().nextInt(wordlist.length)];
  List guessedalphabets = [];
  int status = 0;

  String handletext() {
    String displayword = "";
//Cycles through and captures each character of the word and checks if it's in the list(wordlist)
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      //check if it contains the character
      if (guessedalphabets.contains(char)) {
        displayword += char + " ";
      } else {
        displayword += " ";
      }
    }
    return displayword;
  }

  checkletter(String alphabets) {
    //check word selection and add a list++
    if (word.contains(alphabets)) {
      setState(() {
        guessedalphabets.add(alphabets);
        score += 5;
      });
    } else if (status != 6) {
      setState(() {
        status += 1;
        score -= 5;
      });
    } else {
      print("Você perdeu");
    }

    bool Won = true;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      //check if it contains the character
      if (!guessedalphabets.contains(char)) {
        Won = false;
        break;
      }
    }
    if (Won) {
      print("Você Venceu");
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppThemeColor.primaryColor,
        appBar: AppBar(
          title: const Text("Hangman"),
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppThemeColor.primaryColor,
          actions: [
            //still to be defined
            IconButton(
              iconSize: 40,
              icon: Icon(Icons.power_settings_new_rounded),
              color: Colors.white,
              onPressed: (() {}),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  //Sizing elements
                  width: MediaQuery.of(context).size.width / 3.5,
                  decoration: BoxDecoration(color: Colors.white),
                  height: 30,
                  child: Text("$score",
                      style: TextStyle(fontWeight: FontWeight.w700)),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            //the utilization widget figure
                            figureImage(
                                Game.tentativas >= 0, "assets/hang.png"),
                            figureImage(
                                Game.tentativas >= 1, "assets/head.png"),
                            figureImage(
                                Game.tentativas >= 2, "assets/body.png"),
                            figureImage(Game.tentativas >= 3, "assets/ra.png"),
                            figureImage(Game.tentativas >= 4, "assets/la.png"),
                            figureImage(Game.tentativas >= 5, "assets/rl.png"),
                            figureImage(Game.tentativas >= 6, "assets/ll.png"),
                          ],
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${status} tentativas",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
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
                //keyboard
                SizedBox(
                  height: 20,
                ),
                GridView.count(
                  crossAxisCount: 7,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(right: 10),
                  childAspectRatio: 1.3,
                  children: alphabets.map((e) {
                    return RawMaterialButton(
                      onPressed: Game.selectedChar.contains(e)
                          ? null //checking if the button was selected before
                          : () {
                              setState(() {
                                score += 5;
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
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Karlisson Brendo",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ));
  }
}
