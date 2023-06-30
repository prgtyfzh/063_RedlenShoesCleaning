import 'package:flutter/material.dart';
import 'package:redlenshoescleaning/controller/authcontroller.dart';
import 'package:redlenshoescleaning/model/usermodel.dart';
import 'package:redlenshoescleaning/view/dashboardadmin.dart';
import 'package:redlenshoescleaning/view/dashboarduser.dart';
import 'package:redlenshoescleaning/view/registerpage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            UserModel? loginUser = await authController
                                .signInWithEmailAndPassword(email!, password!);
                            if (loginUser!.role == 'admin') {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DashboardAdmin();
                              }));
                            } else if (loginUser.role != 'admin') {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DashboardUser();
                              }));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Login Failed'),
                                      content: const Text(
                                          'An error occurred during registration.'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'),
                                        )
                                      ],
                                    );
                                  });
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
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign Up',
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
