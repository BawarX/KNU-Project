import 'package:flutter/material.dart';
import 'package:recipie_app/data/meal_dummy.dart';
import 'package:recipie_app/model/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTtile;

  const CategoryMealsScreen(
      {super.key, required this.categoryId, required this.categoryTtile});

  @override
  Widget build(BuildContext context) {
    // filester meed_dummy data to get only the meals that belong to the selected category, and convert the result to a new list.
    final List<Meal> categoryMeals =
        MealDummy.where((meal) => meal.categories.contains(categoryId))
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTtile),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          final meal = categoryMeals[index];
          return Card(
            child: Column(
              children: [
                Image.network(meal.imageUrl, fit: BoxFit.cover),
                SizedBox(height: 10),
                Text(meal.title, style: TextStyle(fontSize: 22)),
                SizedBox(height: 5),
                Text('Duration: ${meal.duration} min'),
                Text('Complexity: ${meal.complexity}'),
                Text('Affordability: ${meal.affordability}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
