import 'package:flutter/material.dart';
import '../widgets/responsive_layout.dart';
import 'IngredientsPage.dart';
import 'StepsPage.dart';


class PlateDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const PlateDetailPage(this.title, this.description, this.imagePath, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
       body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 196, 230, 241),Color.fromARGB(118, 244, 82, 114)],
          ),
        ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: ResponsiveLayout.isSmallScreen(context) ? 150 : 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfoIcon(Icons.shopping_basket, 'Ingredients', '10'),
              _buildInfoIcon(Icons.star, 'Dificultad', 'Baja'),
              _buildInfoIcon(Icons.timer, 'Tiempo', '20 min'),
              _buildInfoIcon(Icons.local_fire_department, 'Calorías', '500'),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IngredientsPage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: ResponsiveLayout.isSmallScreen(context) ? 3 : 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                    horizontal: MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.shopping_basket),
                      Text('Ingredients'),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StepsPage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: ResponsiveLayout.isSmallScreen(context) ? 3 : 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.list),
                      Text('Steps'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
       ),
    );
  }

  Widget _buildInfoIcon(IconData icon, String title, String value) {
    return Column(
      children: [
        Icon(icon, size: 30),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 5),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
