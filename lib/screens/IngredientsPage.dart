import 'package:flutter/material.dart';

class IngredientsPage extends StatelessWidget {
  const IngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingredients'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildIngredient('150g plain flour', 'assets/img/vegetal.png'),
            _buildIngredient('2 tsp baking powde', 'assets/img/cosecha.png'),
            _buildIngredient(
                '3 tbsp golden caster sugar', 'assets/img/vegetal.png'),
            _buildIngredient('400ml can coconut milk, shaken well',
                'assets/img/cosecha.png'),
            _buildIngredient(
                'vegetable oil, for frying', 'assets/img/vegetal.png'),
            _buildIngredient(
                '1-2 bananas, thinly sliced', 'assets/img/cosecha.png'),
            _buildIngredient('2 passion fruits, flesh scooped out',
                'assets/img/vegetal.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredient(String title, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(title),
        ],
      ),
    );
  }
}
