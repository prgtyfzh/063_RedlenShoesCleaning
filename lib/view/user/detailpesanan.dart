import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redlenshoescleaning/controller/pesanancontroller.dart';
import 'package:redlenshoescleaning/view/user/dashboarduser.dart';

class DetailPesanan extends StatefulWidget {
  const DetailPesanan({
    Key? key,
    required this.selectedDate,
    required this.namapemilik,
    required this.notelepon,
    required this.sepatu,
    required this.listitem,
    required this.harga,
  }) : super(key: key);

  final String selectedDate;
  final String namapemilik;
  final String notelepon;
  final String sepatu;
  final String listitem;
  final String harga;

  @override
  State<DetailPesanan> createState() => _DetailPesananState();
}

class _DetailPesananState extends State<DetailPesanan> {
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardUser(),
              ),
            );
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFD9D9D9),
        centerTitle: true,
        title: Text(
          'Detail Pesanan',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 350,
                height: 650,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: StreamBuilder<List<DocumentSnapshot>>(
                  stream: pesc.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final List<DocumentSnapshot> data = snapshot.data!;
                    final int index = data.indexWhere(
                        (doc) => doc['selectedDate'] == widget.selectedDate);

                    if (index == -1) {
                      return const Center(
                        child: Text('Data not found'),
                      );
                    }

                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 30.0,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Tanggal',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  data[index]['selectedDate'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 30.0,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Nama Pemilik',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  data[index]['namapemilik'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 30.0,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'No. Telepon',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  data[index]['notelepon'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 30.0,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Sepatu',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  data[index]['sepatu'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 30.0,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Jenis Treatment',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  data[index]['listitem'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 30.0,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Harga',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  data[index]['harga'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:redlenshoescleaning/controller/pesanancontroller.dart';
// import 'package:redlenshoescleaning/view/user/dashboarduser.dart';

// class DetailPesanan extends StatefulWidget {
//   const DetailPesanan({
//     super.key,
//     required selectedDate,
//     required namapemilik,
//     required notelepon,
//     required sepatu,
//     required listitem,
//     required harga,
//   });

//   @override
//   State<DetailPesanan> createState() => _DetailPesananState();
// }

// class _DetailPesananState extends State<DetailPesanan> {
//   var pesc = PesananController();

//   var index;

//   @override
//   void initState() {
//     pesc.getPesanan();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const DashboardUser(),
//               ),
//             );
//           },
//         ),
//         automaticallyImplyLeading: false,
//         backgroundColor: const Color(0xFFD9D9D9),
//         centerTitle: true,
//         title: Text(
//           'Detail Pesanan',
//           style: GoogleFonts.inter(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Container(
//                 width: 350,
//                 height: 800,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFD9D9D9),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: StreamBuilder<List<DocumentSnapshot>>(
//                   stream: pesc.stream,
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                     final List<DocumentSnapshot> data = snapshot.data!;

//                     return Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.symmetric(
//                               vertical: 10.0,
//                               horizontal: 30.0,
//                             ),
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'Tanggal',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 textAlign: TextAlign.start,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 300,
//                             height: 50,
//                             child: Text(
//                               data[index]['selectedDate'],
//                               style: const TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.symmetric(
//                               vertical: 10.0,
//                               horizontal: 30.0,
//                             ),
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'Nama Pemilik', // Teks di atas Text
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 textAlign: TextAlign.start,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 300,
//                             height: 50,
//                             child: Text(
//                               data[index]['namapemilik'],
//                               style: const TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.symmetric(
//                               vertical: 10.0,
//                               horizontal: 30.0,
//                             ),
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'No. Telepon', // Teks di atas Text
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 textAlign: TextAlign.start,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 300,
//                             height: 50,
//                             child: Text(
//                               data[index]['notelepon'],
//                               style: const TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.symmetric(
//                               vertical: 10.0,
//                               horizontal: 30.0,
//                             ),
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'Sepatu', // Teks di atas Text
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 textAlign: TextAlign.start,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 300,
//                             height: 50,
//                             child: Text(
//                               data[index]['sepatu'],
//                               style: const TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.symmetric(
//                               vertical: 10.0,
//                               horizontal: 30.0,
//                             ),
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'Jenis Treatment', // Teks di atas Text
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 textAlign: TextAlign.start,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 300,
//                             height: 50,
//                             child: Text(
//                               data[index]['listitem'],
//                               style: const TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.symmetric(
//                               vertical: 10.0,
//                               horizontal: 30.0,
//                             ),
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'Harga', // Teks di atas Text
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 textAlign: TextAlign.start,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 300,
//                             height: 50,
//                             child: Text(
//                               data[index]['harga'],
//                               style: const TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.symmetric(
//                               vertical: 10.0,
//                               horizontal: 30.0,
//                             ),
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'Status', // Teks di atas Text
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 textAlign: TextAlign.start,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 300,
//                             height: 50,
//                             child: Text(
//                               data[index]['status'],
//                               style: const TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
