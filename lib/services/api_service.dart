import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../screens/profile_screen.dart';




class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserProfile(UserProfile userProfile) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('user_profiles').doc(user.uid).set({
          'dateOfBirth': userProfile.dateOfBirth,
          'gender': userProfile.gender,
          'weight': userProfile.weight,
          'height': userProfile.height,
        });
      }
    } catch (error) {
      print('Error saving user profile: $error');
      // Puedes lanzar una excepción aquí o manejar el error de otra manera
    }
  }

  Future<UserProfile?> getUserProfile() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userProfileSnapshot =
            await _firestore.collection('user_profiles').doc(user.uid).get();

        if (userProfileSnapshot.exists) {
          return UserProfile(
            dateOfBirth: userProfileSnapshot['dateOfBirth']?.toString() ?? "",
            gender: userProfileSnapshot['gender']?.toString() ?? "",
            weight: userProfileSnapshot['weight']?.toString() ?? "",
            height: userProfileSnapshot['height']?.toString() ?? "",
          );
        }
      }
    } catch (error) {
      print('Error getting user profile: $error');
      // Puedes lanzar una excepción aquí o manejar el error de otra manera
    }

    return null;
  }
}
