// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String errorMessage = '';
  bool isRegistered = false; // Nuevo campo para verificar si el usuario está registrado

  Future<void> registerUser() async {
    try {
      if (password == confirmPassword && password.length >= 6) {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        print('Usuario registrado: ${userCredential.user?.email}');
        print('Nombre: $firstName');
        print('Apellido: $lastName');

        // Actualizar la bandera de registro exitoso
        isRegistered = true;
      } else {
        if (password.length < 6) {
          errorMessage = 'La contraseña debe tener al menos 6 caracteres';
        } else {
          errorMessage = 'Las contraseñas no coinciden';
        }
        notifyListeners();
        return;
      }
    } catch (e) {
      errorMessage = 'Error al registrar: $e';
      notifyListeners();
      return;
    }

    errorMessage = '';
    notifyListeners();
  }
}
