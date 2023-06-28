import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePengeluaran extends StatefulWidget {
  const CreatePengeluaran({super.key});

  @override
  State<CreatePengeluaran> createState() => _CreatePengeluaranState();
}

class _CreatePengeluaranState extends State<CreatePengeluaran> {
  final TextEditingController _tanggalController = TextEditingController();

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 350,
            height: 420,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
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
                        'Tanggal', // Teks di atas TextFormField
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
                      // controller: _tanggalController,
                      decoration: InputDecoration(
                        hintText: 'Tanggal',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () {
                            // DatePicker.showDatePicker(
                            //   context,
                            //   showTitleActions: true,
                            //   minTime: DateTime(2000, 1, 1),
                            //   maxTime: DateTime(2030, 12, 31),
                            //   onConfirm: (date) {
                            //     _tanggalController.text = date
                            //         .toString(); // Atur nilai teks sesuai tanggal yang dipilih
                            //   },
                            //   currentTime: DateTime.now(),
                            //   locale: LocaleType.en,
                            // );
                          },
                        ),
                      ),
                      readOnly: true, // Disable manual text input
                      controller:
                          _tanggalController, // Use a TextEditingController to control the text field value
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 30.0,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nama Barang', // Teks di atas TextFormField
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
                      // controller: _tanggalController,
                      decoration: InputDecoration(
                        hintText: 'Nama Barang',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
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
                        'Harga', // Teks di atas TextFormField
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
                      // controller: _tanggalController,
                      decoration: InputDecoration(
                        hintText: 'Harga',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Retrieve the values from the text fields
                      // String tanggal = _tanggalController.text;
                      // String nama = _namaController.text;
                      // String harga = _hargaController.text;

                      // Do something with the data (e.g., add it to a list, save to a database, etc.)
                      // ...

                      // Clear the text fields
                      // _tanggalController.clear();
                      // _namaController.clear();
                      // _hargaController.clear();

                      // Show a snackbar or navigate to a new screen to indicate successful data submission
                      // ...
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
