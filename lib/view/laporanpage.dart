import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redlenshoescleaning/view/loginpage.dart';

import '../controller/authcontroller.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({super.key});

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authController.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }));
            },
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFD9D9D9),
        centerTitle: true,
        title: Text(
          'REDLEN APPS',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: 350,
            height: 300,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pendapatan',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 85),
                      Text(
                        'Pengeluaran',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDecorationBox(Colors.white),
                      const SizedBox(width: 20),
                      _buildDecorationBox(Colors.white),
                    ],
                  ),
                  const SizedBox(height: 65),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Laba',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 140),
                      Text(
                        'Rugi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDecorationBox(Colors.white),
                      const SizedBox(width: 20),
                      _buildDecorationBox(Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDecorationBox(Color color) {
    return Container(
      width: 150,
      height: 35,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
