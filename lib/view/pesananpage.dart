import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class PesananPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  PesananPage({Key? key}) : super(key: key);

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
                // final bool isConfirmed = pesanan['isConfirmed'] ?? false;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 20.0,
                  ),
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
                        if (pesanan['status'] == 'pending') {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Konfirmasi Pesanan'),
                              content: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Terima Pesanan?'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    _firestore
                                        .collection('pesanan')
                                        .doc(data[index].id)
                                        .update({'status': 'confirmed'});
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Confirm'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      // onTap: () {
                      //   if (pesanan['status'] == "pending") {
                      //     showDialog(
                      //       context: context,
                      //       builder: (context) => AlertDialog(
                      //         title: const Text('Konfirmasi Pesanan'),
                      //         content: const Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             Text('Terima Pesanan?'),
                      //           ],
                      //         ),
                      //         actions: [
                      //           TextButton(
                      //             onPressed: () {
                      //               _firestore
                      //                   .collection('pesanan')
                      //                   .doc(data[index].id)
                      //                   .update(
                      //                       {pesanan['status'] : "Confirmed"});
                      //               Navigator.of(context).pop();
                      //             },
                      //             child: const Text('Confirm'),
                      //           ),
                      //           TextButton(
                      //             onPressed: () {
                      //               Navigator.of(context).pop();
                      //             },
                      //             child: const Text('Cancel'),
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   }
                      // },
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
