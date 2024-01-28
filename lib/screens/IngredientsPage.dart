import 'package:flutter/material.dart';

class IngredientsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingredients'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Aquí puedes agregar tus imágenes pequeñas de verduras con títulos
            _buildIngredient('150g plain flour', '../assets/img/vegetable.jpg'),
            _buildIngredient('2 tsp baking powde', '../assets/img/vegetable.jpg'), 
            _buildIngredient('3 tbsp golden caster sugar', '../assets/img/vegetable.jpg'),
             _buildIngredient('400ml can coconut milk, shaken well', '../assets/img/vegetable.jpg'),
             _buildIngredient('vegetable oil, for frying', '../assets/img/vegetable.jpg'),
                _buildIngredient('1-2 bananas, thinly sliced', '../assets/img/vegetable.jpg'),
               _buildIngredient('2 passion fruits, flesh scooped out', '../assets/img/vegetable.jpg'),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredient(String title, String imagePath) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
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
          SizedBox(width: 10),
          Text(title),
        ],
      ),
    );
  }
}
