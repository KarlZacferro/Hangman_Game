import 'package:flutter/material.dart';
import 'package:hungman_game/core/words.dart';
import '../core/game.dart';
import '../core/words.dart';
import '../ui/colors.dart';
import '../widget/figure_image.dart';
import '../widget/keyboard.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => __GameScreenState();
}

class __GameScreenState extends State<GameScreen> {
//teste

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
                  child: Text("12- Score",
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
                  "7 tentativas",
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
                )
              ],
            ),
          ),
        ));
  }
}
