import 'package:flutter/material.dart';

class AppStyles {
  static BoxDecoration containerDecoration({
    required LinearGradient gradient,
    required String imagePath,
  }) {
    return BoxDecoration(
      gradient: gradient,
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover, // Utiliza BoxFit.cover para que la imagen cubra todo el fondo
      ),
    );
  }
}

class AppContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const AppContainer({Key? key, required this.child, this.padding}) : super(key: key);

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
            Color.fromARGB(104, 244, 161, 200),
            Color.fromARGB(146, 249, 169, 200),
          ],
        ),
        imagePath: 'assets/img/womanfruite4.jpg',
      ),
      child: child,
    );
  }
}
