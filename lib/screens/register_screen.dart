// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously, duplicate_ignore
import 'package:fitvegan/services/auth_service.dart';
import '../utils/app_transitions.dart';
import 'package:flutter/material.dart';
import '../style/style.dart';
import '../widgets/responsive_login.dart';
import 'login_screen.dart';
import 'package:provider/provider.dart';
import '../provider/ChangeNotifier.dart';

class RegisterScreen extends StatelessWidget {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.buildScaffold(
      body: ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        child: RegisterForm(),
      ),
      context: context,
      
    );
  }
}

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        return AppContainer(
          child: Padding(
            padding: EdgeInsets.all(
              ResponsiveLayout.isSmallScreen(context) ? 8.0 : 16.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  ResponsiveLayout.isSmallScreen(context) ? 8.0 : 16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Hello there, ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 252, 250, 250),
                            fontSize: 38),
                        children: [
                          TextSpan(
                            text: 'Create an ',
                            style: TextStyle(fontSize: 25),
                          ),
                          TextSpan(
                            text: 'Account',
                            style: TextStyle(
                                color: Color.fromARGB(255, 244, 92, 54),
                                fontSize: 28),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 253, 253, 253)),
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 252, 250, 250)),
                      ),
                      onChanged: (value) {
                        authProvider.firstName = value;
                      },
                    ),
                    TextField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 254, 251, 251)),
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 254, 254, 254)),
                      ),
                      onChanged: (value) {
                        authProvider.lastName = value;
                      },
                    ),
                    TextField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 253, 253, 253)),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 254, 254)),
                      ),
                      onChanged: (value) {
                        authProvider.email = value;
                      },
                    ),
                    TextField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 251, 250, 250)),
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 254, 254)),
                      ),
                      onChanged: (value) {
                        authProvider.password = value;
                      },
                    ),
                    TextField(
                      style: const TextStyle(
                          color: Colors.white),
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 254, 254)),
                      ),
                      onChanged: (value) {
                        authProvider.confirmPassword = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      authProvider.errorMessage,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 30, 177, 1)),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await authProvider.registerUser();
                        if (authProvider.isRegistered) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Registration successful. Welcome!'),
                              duration: Duration(seconds: 3),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: const Text('Register',
                          style:
                              TextStyle(color: Color.fromARGB(255, 2, 2, 2))),
                    ),
                    const SizedBox(height: 10),
                    const Text('Or',
                        style: TextStyle(
                            color: Color.fromARGB(255, 254, 254, 254))),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          AppTransitions.slideTransition(LoginScreen()),
                        );
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 252, 251, 251)),
                      child: const Text('Already have an account? Log in'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
