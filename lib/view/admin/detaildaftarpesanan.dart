import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redlenshoescleaning/view/admin/dashboardadmin.dart';
import 'package:redlenshoescleaning/view/pesananpage.dart';
import '../../controller/pesanancontroller.dart';

class DetailDataPesanan extends StatefulWidget {
  const DetailDataPesanan({
    Key? key,
    required this.selectedDate,
    required this.namapemilik,
    required this.notelepon,
    required this.sepatu,
    required this.listitem,
    required this.harga,
    required this.status,
  }) : super(key: key);

  final String selectedDate;
  final String namapemilik;
  final String notelepon;
  final String sepatu;
  final String listitem;
  final String harga;
  final String status;

  @override
  State<DetailDataPesanan> createState() => _DetailDataPesananState();
}

class _DetailDataPesananState extends State<DetailDataPesanan> {
  var pesc = PesananController();

  final _formkey = GlobalKey<FormState>();
  String? newstatus;

  @override
  void initState() {
    pesc.getPesanan();
    super.initState();
  }

  void updateStatusInFirestore(String documentId, String status) {
    FirebaseFirestore.instance
        .collection('pesanan')
        .doc(documentId)
        .update({'status': status}).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Status updated successfully')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update status: $error')),
      );
    });
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
                builder: (context) => const DashboardAdmin(),
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
                height: 770,
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
                      child: Form(
                        key: _formkey,
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
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 30.0,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Status',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              height: 50,
                              child: TextFormField(
                                initialValue: data[index]['status'],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.5,
                                ),
                                enabled: data[index]['status'] == 'Confirmed',
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a status';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  if (data[index]['status'] == 'Confirmed') {
                                    setState(() {
                                      newstatus = value;
                                    });
                                  }
                                },
                              ),
                            ),
                            Visibility(
                              visible: data[index]['status'] == 'Confirmed',
                              child: const SizedBox(height: 40),
                            ),
                            Visibility(
                              visible: data[index]['status'] == 'Confirmed',
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    if (newstatus != null) {
                                      updateStatusInFirestore(
                                        data[index].id,
                                        newstatus!,
                                      );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DashboardAdmin(),
                                        ),
                                      );
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF454BE0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  minimumSize: const Size(150, 50),
                                ),
                                child: const Text(
                                  'Simpan',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            // Container(
                            //   width: 300,
                            //   height: 50,
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.circular(10.0),
                            //     border: Border.all(
                            //       color: Colors.black,
                            //       width: 1.0,
                            //     ),
                            //   ),
                            //   child: Align(
                            //     alignment: Alignment.centerLeft,
                            //     child: Padding(
                            //       padding: const EdgeInsets.symmetric(
                            //           horizontal: 10.0),
                            //       child: Text(
                            //         data[index]['status'],
                            //         style: const TextStyle(
                            //           color: Colors.black,
                            //         ),
                            //         textAlign: TextAlign.start,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
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
