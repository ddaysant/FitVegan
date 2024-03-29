import 'package:flutter/material.dart';

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
    );
  }
}
