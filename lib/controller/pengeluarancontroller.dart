import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:redlenshoescleaning/model/pengeluaranmodel.dart';

class PengeluaranController {
  final pengeluaranCollection =
      FirebaseFirestore.instance.collection('pengeluaran');

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  Future<void> addPengeluaran(PengeluaranModel pmodel) async {
    final pengeluaran = pmodel.toMap();

    final DocumentReference docRef =
        await pengeluaranCollection.add(pengeluaran);

    final String docID = docRef.id;

    final PengeluaranModel pengeluaranModel = PengeluaranModel(
        id: docID,
        selectedDate: pmodel.selectedDate,
        namabarang: pmodel.namabarang,
        hargabarang: pmodel.hargabarang);

    await docRef.update(pengeluaranModel.toMap());
  }

  Future<void> updatePengeluaran(PengeluaranModel pmodel) async {
    final PengeluaranModel pengeluaranModel = PengeluaranModel(
        selectedDate: pmodel.selectedDate,
        namabarang: pmodel.namabarang,
        hargabarang: pmodel.hargabarang,
        id: pmodel.id);

    await pengeluaranCollection.doc(pmodel.id).update(pengeluaranModel.toMap());
  }

  Future<void> removePengeluaran(String id) async {
    await pengeluaranCollection.doc(id).delete();
  }

  Future getPengeluaran() async {
    final pengeluaran = await pengeluaranCollection.get();
    streamController.sink.add(pengeluaran.docs);
    return pengeluaran.docs;
  }

  Future<String> getTotalPengeluaran() async {
    try {
      final pengeluaran = await pengeluaranCollection.get();
      double total = 0;
      pengeluaran.docs.forEach((doc) {
        PengeluaranModel pengeluaranModel =
            PengeluaranModel.fromMap(doc.data() as Map<String, dynamic>);
        double harga = double.tryParse(pengeluaranModel.hargabarang) ?? 0;
        total += harga;
      });
      return total.toStringAsFixed(2);
    } catch (e) {
      print('Error while getting total pengeluaran: $e');
      return '0';
    }
  }
}
