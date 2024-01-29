import 'package:flutter/material.dart';

import '../screens/contact.dart';
import '../screens/profile_screen.dart';

class ResponsiveLayout {
  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width <= 1200 &&
        MediaQuery.of(context).size.width > 800;
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width <= 800;
  }

  static Widget buildScaffold({
    required Widget body,
    required BuildContext context,
    bool showFab = true,
  }) {
    return Scaffold(
      body: body,
      floatingActionButton: showFab ? buildFloatingActionButton(context) : null,
    );
  }

  static Widget buildFloatingActionButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileView(),
              ),
            );
          },
          backgroundColor: const Color.fromARGB(255, 255, 104, 104),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.home),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactUsForm(),
              ),
            );
          },
          backgroundColor: const Color.fromARGB(255, 5, 255, 13),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.contact_mail),
        ),
      ],
    );
  }
}
