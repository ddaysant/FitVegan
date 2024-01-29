import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitvegan/widgets/responsive_login.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../utils/app_transitions.dart';
import '../style/style.dart';
import 'profile_screen.dart';
import 'package:fitvegan/style/style_extension.dart';

class LoginScreen extends StatelessWidget {
  final AuthService authService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  Future<void> _login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      print('Usuario autenticado: ${FirebaseAuth.instance.currentUser?.email}');

      // Navega a la página de perfil después de un inicio de sesión exitoso
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileView(),
        ),
      );
    } catch (e) {
      print('Error al iniciar sesión: $e');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al iniciar sesión: $e'),
          backgroundColor: const Color.fromARGB(255, 6, 171, 6),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.buildScaffold(
      body: AppContainer(
        child: Padding(
          padding: EdgeInsets.all(
              ResponsiveLayout.isSmallScreen(context) ? 8.0 : 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                  ResponsiveLayout.isSmallScreen(context) ? 8.0 : 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Hey there,',
                    style: FitStyle.largeText,
                  ),
                  const Text('Welcome Back', style: FitStyle.mediumText),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot your password?',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _login(context),
                    child: const Text('Login',
                        style: TextStyle(color: Color.fromARGB(255, 2, 2, 2))),
                  ),
                  const SizedBox(height: 10),
                  const Text('Or', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () async {
                      try {
                        Navigator.pushReplacement(
                          context,
                          AppTransitions.slideTransition(const ProfileView()),
                        );
                      } catch (e) {
                        print('Error al iniciar sesión: $e');
                      }
                    },
                    child: const Text(
                      'Don’t have an account yet? Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      context: context,
    );
  }
}
