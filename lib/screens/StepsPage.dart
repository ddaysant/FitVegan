import 'package:flutter/material.dart';

class StepsPage extends StatelessWidget {
  const StepsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Steps'),
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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How to prepare:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. Sift the flour and baking powder into a bowl, and stir in 2 tbsp of the sugar and a pinch of salt. Pour the coconut milk into a bowl, whisk to mix in any fat that has separated, then measure out 300ml into a jug. Stir the milk slowly into the flour mixture to make a smooth batter, or whizz everything in a blender.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Heat a shallow frying pan or flat griddle and brush it with oil. Use 2 tbsp of batter to make each pancake, frying two at a time – any more will make it difficult to flip them. Push 4-5 pieces of banana into each pancake and cook until bubbles start to pop on the surface, and the edges look dry. They will be a little more delicate than egg-based pancakes, so turn them over carefully and cook the other sides for 1 min. Repeat to make 8-10 pancakes.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Meanwhile, put the remaining coconut milk and sugar in a small pan. Add a pinch of salt and simmer until the mixture thickens to the consistency of single cream. Use this as a sauce for the pancakes and spoon over some of the passion fruit seeds.',
              style: TextStyle(fontSize: 16),
            ),           
          ],
        ),
      ),
    );
  }
}
