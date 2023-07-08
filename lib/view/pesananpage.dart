import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redlenshoescleaning/view/admin/detaildaftarpesanan.dart';

class PesananPage extends StatefulWidget {
  const PesananPage({Key? key}) : super(key: key);

  @override
  State<PesananPage> createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('pesanan').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> data = snapshot.data!.docs;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final pesanan = data[index].data() as Map<String, dynamic>;

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
                          builder: (context) => DetailDataPesanan(
                            selectedDate: data[index]['selectedDate'],
                            namapemilik: data[index]['namapemilik'],
                            notelepon: data[index]['notelepon'],
                            sepatu: data[index]['sepatu'],
                            listitem: data[index]['listitem'],
                            harga: data[index]['harga'],
                            status: data[index]['status'],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: const Color(0xFFD9D9D9),
                      elevation: 4,
                      child: ListTile(
                        title: Text(pesanan['selectedDate']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(pesanan['namapemilik']),
                            Text(pesanan['sepatu']),
                            Text(pesanan['listitem']),
                            Text(pesanan['status']),
                          ],
                        ),
                        onTap: () {
                          if (pesanan['status'] == 'Pending') {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: Colors.white,
                                title: const Text(
                                  'Konfirmasi Pesanan',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Tanggal: ${pesanan['selectedDate']}'),
                                    Text(
                                        'Nama Pemilik: ${pesanan['namapemilik']}'),
                                    Text('No Telepon: ${pesanan['notelepon']}'),
                                    Text('Sepatu: ${pesanan['sepatu']}'),
                                    Text(
                                        'Jenis Treatment: ${pesanan['listitem']}'),
                                    Text('Harga: ${pesanan['harga']}'),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      _firestore
                                          .collection('pesanan')
                                          .doc(data[index].id)
                                          .update({'status': 'Confirmed'});
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Confirm',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
