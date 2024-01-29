import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'meal_card.dart';

class CarouselPage extends StatelessWidget {
  const CarouselPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
      ),
      items: const [
        PlateCard('Coconut & banana pancakes', 'Description 1',
            'assets/img/coconut-pancakes.png'),
        PlateCard('Carrot & coriander soup', 'Description 2',
            'assets/img/carrot.png'),
        PlateCard(
            'Vegan tagine', 'Description 3', 'assets/img/Vegantagine.png'),
        PlateCard('Vegan banana bread', 'Description 4',
            'assets/img/veganbanana.png'),
        PlateCard('Avocado hummus & crudités', 'Description 5',
            'assets/img/houmous.png'),
      ],
    );
  }
}
