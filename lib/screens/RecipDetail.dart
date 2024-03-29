import 'package:fitvegan/style/style.dart';
import 'package:flutter/material.dart';

class RecipeDetailsView extends StatelessWidget {
  final Map<String, dynamic> recipeDetails;

  const RecipeDetailsView(this.recipeDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    if (recipeDetails.containsKey('error')) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Container(
          color: Colors.white,
          child: Text('An error occurred while loading recipe details.'),
        ),
      );
    }
    if (recipeDetails.containsKey('extendedIngredients') &&
        recipeDetails['extendedIngredients'] != null) {
      List<Widget> ingredientWidgets = List.generate(
        recipeDetails['extendedIngredients'].length,
        (index) => Text(
          '${index + 1}. ${recipeDetails['extendedIngredients'][index]['originalString']}',
          style: const TextStyle(fontSize: 16),
        ),
      );

      return Scaffold(
        appBar: AppBar(
          title: Text(recipeDetails['title'] ?? 'Recipe Details'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                recipeDetails['image'] ?? 'https://via.placeholder.com/400',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildIconText(
                            '${recipeDetails['calories']}', 'Calories'),
                        _buildIconText(
                            '${recipeDetails['protein']}', 'Proteins'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Ingredients:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: ingredientWidgets,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Instructions:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (recipeDetails['instructions'] != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: recipeDetails['instructions']
                            .toString()
                            .split('\n')
                            .map(
                              (step) => Text(
                                step,
                                style: const TextStyle(fontSize: 16),
                              ),
                            )
                            .toList(),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(recipeDetails['title'] ?? 'Recipe Details'),
        ),
        body: const Center(
          child: Text('No recipe details found.'),
        ),
      );
    }
  }

  Widget _buildIconText(String text, String label) {
    return Column(
      children: [
        const Icon(Icons.info),
        const SizedBox(height: 4),
        Text('$text $label'),
      ],
    );
  }
}
