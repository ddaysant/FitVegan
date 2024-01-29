import 'package:flutter/material.dart';

import '../widgets/responsive_layout.dart';

class ContactUsForm extends StatefulWidget {
  const ContactUsForm({Key? key}) : super(key: key);

  @override
  ContactUsFormState createState() => ContactUsFormState();
}

class ContactUsFormState extends State<ContactUsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.buildScaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/womanfruite4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AppContainer(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(fontSize: 14.0),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 14.0),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: _messageController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your message';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Message',
                      labelStyle: TextStyle(fontSize: 14.0),
                    ),
                    maxLines: 4,
                  ),
                  const SizedBox(height: 14.0),
                  ElevatedButton(
                    onPressed: () {
                      _submitForm();
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 16.0, color: Color.fromARGB(255, 2, 2, 2)),
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String email = _emailController.text;
      String message = _messageController.text;

      print('Name: $name');
      print('Email: $email');
      print('Message: $message');
    }
  }
}

class AppContainer extends StatelessWidget {
  final Widget child;

  const AppContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.7,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
