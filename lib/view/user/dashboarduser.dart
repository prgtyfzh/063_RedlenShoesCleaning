import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redlenshoescleaning/controller/pesanancontroller.dart';
import 'package:redlenshoescleaning/view/user/createpesanan.dart';
import 'package:redlenshoescleaning/view/user/detailpesanan.dart';

import '../../controller/authcontroller.dart';
import '../loginpage.dart';

class DashboardUser extends StatefulWidget {
  const DashboardUser({super.key});

  @override
  State<DashboardUser> createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  final AuthController authController = AuthController();
  var pesc = PesananController();

  @override
  void initState() {
    pesc.getPesanan();
    super.initState();
  }

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
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder<List<DocumentSnapshot>>(
            stream: pesc.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final List<DocumentSnapshot> data = snapshot.data!;

              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 20.0,
                    ),
                    child: InkWell(
                      onLongPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPesanan(
                              selectedDate: data[index]['selectedDate'],
                              namapemilik: data[index]['namapemilik'],
                              notelepon: data[index]['notelepon'],
                              sepatu: data[index]['sepatu'],
                              listitem: data[index]['listitem'],
                              harga: data[index]['harga'],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: const Color(0xFFD9D9D9),
                        elevation: 4,
                        child: ListTile(
                          title: Text(data[index]['selectedDate']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index]['sepatu']),
                              Text(data[index]['listitem']),
                              // Text(data[index]['status']),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePesanan(),
            ),
          );
        },
        backgroundColor: const Color(0xFFD9D9D9),
        child: const Icon(Icons.add),
      ),
    );
  }
}
