import 'package:flutter/material.dart';
import '../screens/RecipeView.dart';
import '../screens/contact.dart';
import '../screens/fitness.dart';
import '../screens/meal_page.dart';

class DataEntryRow extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onPressed;

  const DataEntryRow({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(icon, height: 24, width: 24),
      title: Text(title),
      onTap: () {
        if (title == "Vegan Meal") {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                child: PlateCardPage(username: ''),
              ),
              transitionDuration: Duration(milliseconds: 500),
            ),
          );
        }else  if (title == "Activities") {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                child: FitnessScreen(),
              ),
              transitionDuration: Duration(milliseconds: 500),
            ),
          );
      }else  if (title == "Recipes to inspire you") {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                child: const RecipeView(),
              ),
              transitionDuration: Duration(milliseconds: 500),
            ),
          );
      }else  if (title == "Contact Us") {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                child: const ContactUsForm(),
              ),
              transitionDuration: Duration(milliseconds: 500),
            ),
          );
      }
      },
    );
  }
}
