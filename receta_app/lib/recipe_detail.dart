import 'package:flutter/material.dart';
import 'package:receta_app/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(image: AssetImage(widget.recipe.imageUrl)),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text('ingredientes'),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.recipe.ingredients.length,
                  itemBuilder: (BuildContext context, index) {
                    final ingredient = widget.recipe.ingredients[index];
                    return Text(
                        '${ingredient.quantity} ${ingredient.measure} ${ingredient.name}');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}