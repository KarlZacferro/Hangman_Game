import 'package:flutter/material.dart';
import 'dart:math';

//Randomly search for the word and display depending on the size(word)
String word = wordlist[Random().nextInt(wordlist.length)];
List guessedalphabets = [];
String handletext() {
  String displayword = "";
//Cycles through and captures each character of the word and checks if it's in the list(wordlist)
  for (int i = 0; i < word.length; i++) {
    String char = word[i];
    //check if it contains the character
    if (guessedalphabets.contains(char)) {
      displayword += char;
    } else {
      displayword += " ";
    }
  }
  return displayword;
}

List wordlist = ['FLUTTER', 'AULA', 'CARRO', 'TEMPO', 'LUZ'];

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
