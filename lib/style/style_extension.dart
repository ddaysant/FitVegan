
import 'package:flutter/material.dart';

class TitleSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleSubtitle({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 254, 253, 253)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class FitStyle {
  static Color get primaryColor1 => const Color.fromARGB(200, 239, 204, 204);
  static LinearGradient get primaryGradient => LinearGradient(
        colors: primaryG,
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      );
  static Color get primaryColor2 => const Color.fromARGB(255, 216, 167, 185);

  static Color get secondaryColor1 => const Color.fromARGB(0, 227, 128, 153);
  static Color get secondaryColor2 => const Color(0xffEEA4CE);

  static List<Color> get primaryG => [primaryColor2, primaryColor1];
  static List<Color> get secondaryG => [secondaryColor2, secondaryColor1];

  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightGray => const Color(0xffF7F8F8);

  static const largeText = TextStyle(fontSize: 30, color: Color.fromARGB(255, 251, 250, 250));
  static const mediumText = TextStyle(fontSize: 18, color: Color.fromARGB(255, 251, 250, 250));
  static const smallText =
      TextStyle(fontSize: 10, color: Color.fromARGB(255, 252, 251, 251));
}
