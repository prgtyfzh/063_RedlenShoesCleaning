import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PesananPage extends StatefulWidget {
  const PesananPage({super.key});

  @override
  State<PesananPage> createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFD9D9D9),
        centerTitle: true,
        title: Text(
          'Daftar Pesanan',
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
                      vertical: 5.0, horizontal: 20.0),
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
                            Text('Harga'),
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
    );
  }
}
