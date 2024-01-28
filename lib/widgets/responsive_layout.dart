// responsive_layout.dart

import 'package:flutter/material.dart';

import '../screens/contact.dart';
import '../screens/profile_screen.dart';


class ResponsiveLayout {
  
  static Widget buildScaffold({
    required Widget body,
    required BuildContext context,
  })
  
   {
    return Scaffold(
      body: body,
      floatingActionButton: buildFloatingActionButton(context),
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
                  builder: (context) => ProfileView(),
                ),
              );
            },
          child: Icon(Icons.home),
        ),
        SizedBox(width: 10),
        FloatingActionButton(
          onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactUsForm(),
                ),
              );
            },
          child: Icon(Icons.contact_mail),
        ),
      ],
    );
  }
}
