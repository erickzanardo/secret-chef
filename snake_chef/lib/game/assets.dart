import 'package:flame/animation.dart';
import 'package:flame/sprite.dart';
import 'package:flame/spritesheet.dart';
import 'package:flame/flame.dart';
import 'package:flame_fire_atlas/flame_fire_atlas.dart';

import './stage.dart';

class Assets {
  static FireAtlas ingredients;
  static SpriteSheet floor;
  static SpriteSheet snake;
  static SpriteSheet plates;
  static  Animation cherries;

  static Future<void> load() async {
    await Flame.images.loadAll([
      "floor.png",
      "snake.png",
      "nine_box_tileset.png",
      "nine_box_white_tileset.png",
      "plates.png",
      "cherries.png",
    ]);
    ingredients = await FireAtlas.fromAsset('atlases/Ingredients.fa');
    floor = SpriteSheet(imageName: "floor.png", textureHeight: 16, textureWidth: 16, columns: 1, rows: 2);
    snake = SpriteSheet(imageName: "snake.png", textureHeight: 16, textureWidth: 16, columns: 5, rows: 5);
    plates = SpriteSheet(imageName: "plates.png", textureHeight: 32, textureWidth: 48, columns: 1, rows: 1);
    cherries = Animation.sequenced(
        'cherries.png',
        8,
        textureWidth: 80,
        textureHeight: 48,
        stepTime: 0.2,
        loop: true,
    );
  }
}

class Ingredients {
  static Map<Ingredient, Sprite> spriteCache = {};

  static Sprite getSprite(Ingredient ingredient) {
    if (!spriteCache.containsKey(ingredient)) {
      spriteCache[ingredient] = Assets.ingredients.getSprite(ingredient.toString().split('.')[1]);
    }
    return spriteCache[ingredient];
  }
}

class Floor {
  static Sprite getFloorBorder() {
    return Assets.floor.getSprite(1, 0);
  }

  static Sprite getFloorTile() {
    return Assets.floor.getSprite(0, 0);
  }
}

class Snake {
  static Sprite getHeadFacingLeft() {
    return Assets.snake.getSprite(0, 0);
  }

  static Sprite getHeadFacingRight() {
    return Assets.snake.getSprite(0, 3);
  }

  static Sprite getHeadFacingUp() {
    return Assets.snake.getSprite(2, 1);
  }

  static Sprite getHeadFacingDown() {
    return Assets.snake.getSprite(3, 0);
  }

  static Sprite getHeadCornerTopRight() {
    return Assets.snake.getSprite(2, 4);
  }

  static Sprite getHeadCornerTopLeft() {
    return Assets.snake.getSprite(3, 4);
  }

  static Sprite getHeadCornerBottomRight() {
    return Assets.snake.getSprite(1, 4);
  }

  static Sprite getHeadCornerBottomLeft() {
    return Assets.snake.getSprite(0, 4);
  }

  static Sprite getTopViewBodyPart() {
    return Assets.snake.getSprite(1, 0);
  }

  static Sprite getSideViewBodyPart() {
    return Assets.snake.getSprite(1, 1);
  }

  static Sprite getTailFacingLeft() {
    return Assets.snake.getSprite(0, 2);
  }

  static Sprite getTailFacingRight() {
    return Assets.snake.getSprite(0, 1);
  }

  static Sprite getTailFacingUp() {
    return Assets.snake.getSprite(2, 0);
  }

  static Sprite getTailFacingDown() {
    return Assets.snake.getSprite(3, 1);
  }

  static Sprite getTopLeftCorner() {
    return Assets.snake.getSprite(2, 2);
  }

  static Sprite getTopRightCorner() {
    return Assets.snake.getSprite(2, 3);
  }

  static Sprite getBottomLeftCorner() {
    return Assets.snake.getSprite(3, 2);
  }

  static Sprite getBottomRightCorner() {
    return Assets.snake.getSprite(3, 3);
  }
}

class Plates {
  static Sprite getSprite(RecipeName recipe) {
    switch (recipe) {
      case RecipeName.CHERRY_PIE:
        return Assets.plates.getSprite(0, 0);
    }

    return null;
  }
}
