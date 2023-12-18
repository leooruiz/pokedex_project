import 'package:flutter/material.dart';

Color? typeColor(String? type) {
  final Color? color;
  switch (type) {
    case 'fire':
      color = const Color.fromARGB(255, 214, 64, 0);
      break;
    case 'normal':
      color = const Color.fromARGB(255, 255, 175, 63);
      break;
    case 'water':
      color = const Color.fromARGB(255, 80, 150, 255);
      break;
    case 'ghost':
      color = const Color.fromARGB(255, 93, 63, 130);
      break;
    case 'rock':
      color = const Color.fromARGB(255, 120, 120, 0);
      break;
    case 'fighting':
      color = const Color.fromARGB(255, 120, 0, 0);
      break;
    case 'grass':
      color = const Color.fromARGB(220, 0, 169, 11);
      break;
    case 'ice':
      color = const Color.fromARGB(255, 0, 194, 194);
      break;
    case 'psychic':
      color = const Color.fromARGB(160, 170, 0, 90);
      break;
    case 'electric':
      color = const Color.fromARGB(210, 240, 176, 0);
      break;
    case 'bug':
      color = const Color.fromARGB(255, 76, 142, 0);
      break;
    case 'ground':
      color = const Color.fromARGB(125, 245, 127, 23);
      break;
    case 'poison':
      color = const Color.fromARGB(255, 145, 0, 203);
      break;
    case 'flying':
      color = const Color.fromARGB(255, 255, 121, 228);
      break;
    case 'fairy':
      color = const Color.fromARGB(255, 255, 157, 253);
      break;
    case 'steel':
      color = const Color.fromARGB(255, 93, 94, 122);
      break;
    case 'dark':
      color = const Color.fromARGB(123, 113, 69, 30);
      break;
    case 'dragon':
      color = const Color.fromARGB(182, 82, 0, 153);
      break;
    default:
      color = Colors.grey;
      break;
  }
  return color;
}
