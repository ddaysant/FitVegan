import 'package:flutter/material.dart';

class AppStyles {
  static BoxDecoration containerDecoration({
    required LinearGradient gradient,
    required Color filterColor,
  }) {
    return BoxDecoration(
      gradient: gradient,
    );
  }
}

class AppContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const AppContainer({Key? key, required this.child, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: AppStyles.containerDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 245, 60, 106),
            Color.fromARGB(66, 245, 60, 1060),
          ],
        ),
        filterColor: const Color.fromARGB(66, 245, 60, 106),
      ),
      child: child,
    );
  }
}
