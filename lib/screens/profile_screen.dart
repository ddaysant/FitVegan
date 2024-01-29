// profile.dart

import 'package:flutter/material.dart';
import '../app_routes/DataEntryRow.dart';
import '../widgets/responsive_layout.dart';


class UserProfile {
  String dateOfBirth = "";
  String gender = "";
  String weight = "";
  String height = "";

  UserProfile({
    required this.dateOfBirth,
    required this.gender,
    required this.weight,
    required this.height,
  });

  UserProfile.empty();
}

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool positive = false;
  UserProfile userProfile = UserProfile.empty();
  String age = "0";
  List accountArr = [
    {"image": "assets/img/dieta.png", "name": "Vegan Meal", "tag": "2"},
    {"image": "assets/img/ejercicio.png", "name": "Activities", "tag": "3"},
    {"image": "assets/img/feijoada.png", "name": "Recipes to inspire you", "tag": "3"},
  ];

  List otherArr = [
    {"image": "assets/img/contacto.png", "name": "Contact Us", "tag": "6"},
  ];






  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.buildScaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double screenWidth = MediaQuery.of(context).size.width;

          return Stack(
            children: [
              Image.asset(
                "assets/img/juice.jpg",
                width: screenWidth,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              SingleChildScrollView(
                child: Container(
                  width: screenWidth,
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                    horizontal: screenWidth * 0.04,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(123, 245, 128, 128),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 2),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Welcome!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                            Text(
                              "Your Vegan Program",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ),
                       const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 2),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "For You",
                              style: TextStyle(
                               color: Colors.black,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                            for (var iObj in accountArr)
                              DataEntryRow(
                                icon: iObj["image"].toString(),
                                title: iObj["name"].toString(),
                                onPressed: () {},
                              ),
                          ],
                        ),
                      ),
                       const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 2),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Other",
                              style: TextStyle(
                              color: Colors.black,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                            for (var iObj in otherArr)
                              DataEntryRow(
                                icon: iObj["image"].toString(),
                                title: iObj["name"].toString(),
                                onPressed: () {},
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      context: context,
    );
  }
}
