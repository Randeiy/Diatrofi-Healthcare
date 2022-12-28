import 'package:meta/meta.dart';
import 'dart:convert';

FoodList foodListFromJson(String str) => FoodList.fromJson(json.decode(str));

String foodListToJson(FoodList data) => json.encode(data.toJson());

class FoodList {
    FoodList({
        required this.foods,
    });

    final List<Food> foods;

    factory FoodList.fromJson(Map<String, dynamic> json) => FoodList(
        foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
    };
}

class Food {
    Food({
        required this.id,
      required this.name,
        required this.description,
        required this.category,
        required this.imgUrl,
        required this.kcal,
        required this.fats,
        required this.prots,
        required this.carbs,
        required this.suitable,
        required this.recipe,
    });

    final int id;
    final String name;
    final String description;
    final String category;
    final String imgUrl;
    final int kcal;
    final int fats;
    final int prots;
    final int carbs;
    final List<String> suitable;
    final Recipe recipe;

    factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        imgUrl: json["imgUrl"],
        kcal: json["kcal"],
        fats: json["fats"],
        prots: json["prots"],
        carbs: json["carbs"],
        suitable: List<String>.from(json["suitable"].map((x) => x)),
        recipe: Recipe.fromJson(json["recipe"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category": category,
        "imgUrl": imgUrl,
        "kcal": kcal,
        "fats": fats,
        "prots": prots,
        "carbs": carbs,
        "suitable": List<dynamic>.from(suitable.map((x) => x)),
        "recipe": recipe.toJson(),
    };
}

class Recipe {
    Recipe({
        required this.ingredient,
        required this.steps,
    });

    final List<String> ingredient;
    final List<String> steps;

    factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        ingredient: List<String>.from(json["ingredient"].map((x) => x)),
        steps: List<String>.from(json["steps"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "ingredient": List<dynamic>.from(ingredient.map((x) => x)),
        "steps": List<dynamic>.from(steps.map((x) => x)),
    };
}
