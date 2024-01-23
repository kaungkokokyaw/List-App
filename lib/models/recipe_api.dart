import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:list_app/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": '24', "start": '0', "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'bd73b382f2msh3d6ea804d96a3d2p11f872jsn73e3158721ee',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }

    return Recipe.recipeFromSnapShot(temp);
  }
}
