import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redlenshoescleaning/view/user/createpesanan.dart';

class DashboardUser extends StatefulWidget {
  const DashboardUser({super.key});

  @override
  State<DashboardUser> createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 20.0,
                  ),
                  child: InkWell(
                    onLongPress: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => UpdateContact(
                      //       id: data[index]['id'],
                      //       name: data[index]['name'],
                      //       phone: data[index]['phone'],
                      //       email: data[index]['email'],
                      //       address: data[index]['address'],
                      //     ),
                      //   ),
                      // );
                    },
                    child: const Card(
                      color: Color(0xFFD9D9D9),
                      elevation: 4,
                      child: ListTile(
                        title: Text('Tanggal'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sepatu'),
                            Text('Nama Treatment'),
                            Text('Status'),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
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
