import 'package:flutter/material.dart';

import '../widgets/responsive_layout.dart';
import '../widgets/carousel_page.dart';

class PlateCardPage extends StatelessWidget {
  final String username;

  PlateCardPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.buildScaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Opacity(
              opacity: 0.7,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/starryuniverse1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(50),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 75),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Menu for day, $username!',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Preparation in less than 20 minutes',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              height: 650.0,
              child: CarouselPage(),
            ),
          ],
        ),
      ),
      context: context,
    );
  }
}
