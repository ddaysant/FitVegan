import 'package:flutter/material.dart';
import 'package:flutter_proyecto_fitness/screens/register_screen.dart';
import 'package:flutter_proyecto_fitness/screens/profile_screen.dart'; 
import '../services/auth_service.dart';
import '../style/style.dart';
import '../utils/app_transitions.dart';

class HomeScreen extends StatelessWidget {
  final AuthService authService = AuthService();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppContainer(
        padding: null,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Hey there, ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 254, 254, 254),
                    fontSize: 38,
                  ),
                  children: [
                    TextSpan(
                      text: 'Create an ',
                      style: TextStyle(fontSize: 25),
                    ),
                    TextSpan(
                      text: 'Account',
                      style: TextStyle(color: Color.fromARGB(255, 54, 244, 54), fontSize: 28),
                    ),
                  ],
                ),
              ),
Container(
  margin: const EdgeInsets.all(50),
  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 75),
  decoration: BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.white, width: 2),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),
    ],
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: 20), // Agregué un espacio adicional para separar el texto del botón
      ElevatedButton(
        onPressed: () async {
          // Redirige a la página de registro con una transición de slide
          Navigator.pushReplacement(
            context,
            AppTransitions.slideTransition(RegisterScreen()),
          );
        },
        style: ElevatedButton.styleFrom(primary: Colors.transparent,
        ),
        child: const Text("Let's go", style: TextStyle(fontSize: 36, color: Color.fromARGB(255, 254, 253, 253))),
      ),
    ],
  ),
),

              ElevatedButton(
                onPressed: () async {
                  // Intenta iniciar sesión con las credenciales proporcionadas
                  try {
                    await authService.signIn('r@gmail.com', 'da1234');
                    // Si el inicio de sesión es exitoso, navega a la pantalla de perfil
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      AppTransitions.slideTransition(const ProfileView()),
                    );
                  } catch (e) {
                    // Manejo de errores en caso de fallo en el inicio de sesión
                    print('Error al iniciar sesión: $e');
                  }
                },
                style: ElevatedButton.styleFrom(
                  
                ),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
