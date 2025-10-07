import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class Solitaire extends FlameGame {
  @override
  Future<void> onLoad() async {
    await Flame.images.load('solitaire-sprites.png');
  }
}

Sprite SolitaireSprites(double x, double y, double largeur, double hauteur) {
  return Sprite(
    Flame.images.fromCache('solitaire-sprites.png'),
    srcPosition: Vector2(x, y),
    srcSize: Vector2(largeur, hauteur),
  );
}
