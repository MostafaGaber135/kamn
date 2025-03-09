import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/healthy_food_features/data/models/food_item_model.dart';

class Category {
  final String name;
  final String icon;
  final List<FoodItem> foodItems;

  Category({required this.foodItems, required this.name, required this.icon});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      icon: json['icon'],
      foodItems: json['foodItems'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon,
    };
  }
}

// Sample Data Lists
List<Category> categories = [
  Category(name: "All", icon: "assets/icons/vegan_1.svg", foodItems: homeCooks),
  Category(
      name: "Vegan",
      icon: IconLinks.vegan, //"assets/icons/chickenTest.svg",
      foodItems: trendingFoods),
  Category(name: "Chicken", icon: IconLinks.chickenleg, foodItems: homeCooks),
  Category(name: "meats", icon: IconLinks.steak, foodItems: trendingFoods),
];
