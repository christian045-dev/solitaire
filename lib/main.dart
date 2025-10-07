import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'solitaire_game.dart';

void main() {
  final game = Solitaire();
  runApp(GameWidget(game: game));
}
