import 'package:flutter/material.dart';

import '../controller/authcontroller.dart';
import '../model/usermodel.dart';
import 'loginpage.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    String? name;
    String? email;
    String? password;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/LoginPage.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/image/LogoRedlen.png',
                        width: 180,
                        height: 180,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 250,
                        ),
                        child: const Text(
                          'Name',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Name',
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 250,
                        ),
                        child: const Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 220,
                        ),
                        child: const Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            suffixIcon: Icon(Icons.remove_red_eye),
                          ),
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 155,
                        ),
                        child: const Text(
                          'Confirm Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            suffixIcon: Icon(Icons.remove_red_eye),
                          ),
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            UserModel? registeredUser = await authController
                                .registerWithEmailAndPassword(
                                    email!, password!, name!);
                            if (registeredUser != null) {
                              // Registration successfull
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title:
                                        const Text('Registration Successful'),
                                    content: const Text(
                                        'You have been successfully registered.'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return LoginPage();
                                          }));
                                          // Navigate to the next screen or perform any desired action
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              // Registration failed
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Registration Failed'),
                                    content: const Text(
                                        'An error occured during registration.'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF454BE0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          minimumSize: const Size(280, 50),
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
