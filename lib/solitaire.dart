import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flame/components.dart';

import 'composants/Stock.dart';
import 'composants/corbeille.dart';
import 'composants/fondation.dart';
import 'composants/pile.dart';

class Solitaire extends FlameGame {
  static const double largeurCarte = 1000.0;
  static const double hauteurCarte = 1400.0;
  static const double ecartCarte = 175.0;
  static const double rayonCarte = 100.0;
  static final Vector2 tailleCarte = Vector2(largeurCarte, hauteurCarte);

  @override
  Future<void> onLoad() async {
    await Flame.images.load('solitaire-sprites.png');
    final stock = Stock()
      ..size = tailleCarte
      ..position = Vector2(ecartCarte, ecartCarte);
    final corbeille = Corbeille()
      ..size = tailleCarte
      ..position = Vector2(largeurCarte + 2 * ecartCarte, ecartCarte);
    final fondation = List.generate(
      4,
      (i) => Fondation()
        ..size = tailleCarte
        ..position = Vector2(
          (i + 3) * (largeurCarte + ecartCarte) + ecartCarte,
          ecartCarte,
        ),
    );
    final piles = List.generate(
      7,
      (i) => Pile()
        ..size = tailleCarte
        ..position = Vector2(
          ecartCarte + i * (largeurCarte + ecartCarte),
          hauteurCarte + 2 * ecartCarte,
        ),
    );

    world.add(stock);
    world.add(corbeille);
    world.addAll(fondation);
    world.addAll(piles);

    camera.viewfinder.visibleGameSize = Vector2(
      7 * largeurCarte + 8 * ecartCarte,
      4 * hauteurCarte + 3 * ecartCarte,
    );
    camera.viewfinder.position = Vector2(
      3.5 * largeurCarte + 4 * ecartCarte,
      0,
    );
    camera.viewfinder.anchor = Anchor.topCenter;
  }
}

Sprite SolitaireSprites(double x, double y, double largeur, double hauteur) {
  return Sprite(
    Flame.images.fromCache('solitaire-sprites.png'),
    srcPosition: Vector2(x, y),
    srcSize: Vector2(largeur, hauteur),
  );
}
