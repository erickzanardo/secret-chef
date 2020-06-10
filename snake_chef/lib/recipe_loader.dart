import 'package:flame/flame.dart';

import 'dart:convert';

class RecipeLoader {
  static Map<String, Map<String, dynamic>> recipes = {};

  static Future<void> load() async {
    await Future.wait([
      _loadFile("CHERRY_PIE"),
    ]);
  }

  static Future<void> _loadFile(String file) async {
    final raw = await Flame.assets.readFile("recipes/$file.json");
    final json = jsonDecode(raw);
    recipes[file] = json;
  }
}
