import 'package:flutter/material.dart';

import '../app_routes/DataEntryRow.dart';
import '../services/api_service.dart';

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
     {"image": "../assets/img/feijoada.png", "name": "Recipes to inspire you", "tag": "3"},
  ];

  List otherArr = [
    {"image": "assets/img/contacto.png", "name": "Contact Us", "tag": "6"},
  ];

  final FirebaseService _firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      UserProfile? loadedProfile = (await _firebaseService.getUserProfile()) as UserProfile?;

      if (loadedProfile != null) {
        setState(() {
          userProfile = loadedProfile;
        });
      }
    } catch (error) {
      print('Error al cargar el perfil: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/img/juice.jpg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 2),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome!",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 2, 2),
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Your Vegan Program",
                          style: TextStyle(
                            color: Color.fromARGB(255, 9, 9, 9),
                            fontSize: 21,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 2),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "For You",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 2, 2),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: accountArr.length,
                          itemBuilder: (context, index) {
                            var iObj = accountArr[index] as Map? ?? {};
                            return DataEntryRow(
                              icon: iObj["image"].toString(),
                              title: iObj["name"].toString(),
                              onPressed: () {},
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 2),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Other",
                          style: TextStyle(
                            color: Color.fromARGB(255, 9, 9, 9),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: otherArr.length,
                          itemBuilder: (context, index) {
                            var iObj = otherArr[index] as Map? ?? {};
                            return DataEntryRow(
                              icon: iObj["image"].toString(),
                              title: iObj["name"].toString(),
                              onPressed: () {},
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

