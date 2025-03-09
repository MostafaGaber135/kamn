class FoodItem {
  final String name;
  final String imageUrl;
  final double price;
  final int calories;
  final double rating;
  final List<String> tags;
  final String restaurantName;
  final int deliveryTime;

  FoodItem({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.calories,
    required this.rating,
    required this.tags,
    required this.restaurantName,
    required this.deliveryTime,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
      calories: json['calories'],
      rating: json['rating'].toDouble(),
      tags: List<String>.from(json['tags']),
      restaurantName: json['restaurantName'],
      deliveryTime: json['deliveryTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'calories': calories,
      'rating': rating,
      'tags': tags,
      'restaurantName': restaurantName,
      'deliveryTime': deliveryTime,
    };
  }
}

List<FoodItem> trendingFoods = [
  FoodItem(
    name: "Fruit Salad",
    imageUrl: "assets/images/salad_1.png",
    price: 150.0,
    calories: 250,
    rating: 4.7,
    tags: ["Healthy", "Low-Carb", "lowwwww"],
    restaurantName: "Sarah's House",
    deliveryTime: 30,
  ),
  FoodItem(
    name: "Chicken Salad",
    imageUrl: "assets/images/salad_1.png",
    price: 250.0,
    calories: 150,
    rating: 4.8,
    tags: ["Protein", "Keto"],
    restaurantName: "FitFuel Restaurant",
    deliveryTime: 25,
  ),
  FoodItem(
    name: "Chicken Salad",
    imageUrl: "assets/images/salad_1.png",
    price: 250.0,
    calories: 150,
    rating: 4.8,
    tags: ["Protein", "Keto"],
    restaurantName: "FitFuel Restaurant",
    deliveryTime: 25,
  ),
];

List<FoodItem> homeCooks = [
  FoodItem(
    name: "Grilled Chicken Salad",
    imageUrl: "assets/images/homCookiesTest.png",
    price: 150.0,
    calories: 500,
    rating: 4.8,
    tags: ["Low-Carb", "Paleo"],
    restaurantName: "Sarah's Kitchen",
    deliveryTime: 40,
  ),
  FoodItem(
    name: "Quinoa & Chickpea Salad",
    imageUrl: "assets/images/homCookiesTest.png",
    price: 90.0,
    calories: 400,
    rating: 4.6,
    tags: ["Keto", "Mediterranean"],
    restaurantName: "Omar’s Healthy Bites",
    deliveryTime: 20,
  ),
  FoodItem(
    name: "Quinoa & Chickpea Salad",
    imageUrl: "assets/images/homCookiesTest.png",
    price: 90.0,
    calories: 400,
    rating: 4.6,
    tags: ["Keto", "Mediterranean"],
    restaurantName: "Omar’s Healthy Bites",
    deliveryTime: 20,
  ),
];
