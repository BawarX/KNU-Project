import 'package:flutter/material.dart';
import 'package:recipie_app/data/dummy_data.dart';
import 'package:recipie_app/screen/category_meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KNU-Project"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
        ),
        itemCount: dummy_categories.length,
        itemBuilder: (context, index) {
          final category = dummy_categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CategoryMealsScreen(
                    categoryId: category.id,
                    categoryTtile: category.title,
                  ),
                ),
              );
            },
            child: Container(
              color: category.color,
              child: Center(
                child: Text(
                  category.title,
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
