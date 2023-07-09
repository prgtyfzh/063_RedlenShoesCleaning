import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:redlenshoescleaning/model/pesananmodel.dart';

class PesananController {
  final pesananCollection = FirebaseFirestore.instance.collection('pesanan');

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  Future<void> addPesanan(PesananModel pesmodel) async {
    final pesanan = pesmodel.toMap();

    final DocumentReference docRef = await pesananCollection.add(pesanan);

    final String docID = docRef.id;

    final PesananModel pesananModel = PesananModel(
      id: docID,
      selectedDate: pesmodel.selectedDate,
      namapemilik: pesmodel.namapemilik,
      notelepon: pesmodel.notelepon,
      sepatu: pesmodel.sepatu,
      harga: pesmodel.harga,
      status: pesmodel.status,
      listitem: pesmodel.listitem,
    );

    await docRef.update(pesananModel.toMap());
  }

  Future<void> updatePesanan(PesananModel pesmodel) async {
    final PesananModel pesananModel = PesananModel(
        selectedDate: pesmodel.selectedDate,
        namapemilik: pesmodel.namapemilik,
        notelepon: pesmodel.notelepon,
        sepatu: pesmodel.sepatu,
        harga: pesmodel.harga,
        status: pesmodel.status,
        listitem: pesmodel.listitem,
        id: pesmodel.id);
    await pesananCollection.doc(pesmodel.id).update(pesananModel.toMap());
  }

  Future<void> removePesanan(String id) async {
    await pesananCollection.doc(id).delete();
  }

  // Future getPesanan() async {
  //   final pesanan = await pesananCollection.get();
  //   streamController.sink.add(pesanan.docs);
  //   return pesanan.docs;
  // }

  Future<List<DocumentSnapshot>> getPesanan() async {
    final pesanan = await pesananCollection.get();
    streamController.sink.add(pesanan.docs);
    return pesanan.docs;
  }

  // Future<String> getTotalPendapatan() async {
  //   try {
  //     final pengeluaran = await pesananCollection.get();
  //     double total = 0;
  //     pengeluaran.docs.forEach((doc) {
  //       PesananModel pesananModel =
  //           PesananModel.fromMap(doc.data() as Map<String, dynamic>);
  //       double harga = double.tryParse(pesananModel.harga) ?? 0;
  //       total += harga;
  //     });
  //     return total.toStringAsFixed(2);
  //   } catch (e) {
  //     print('Error while getting total pendapatan: $e');
  //     return '0';
  //   }
  // }

  Future<String> getTotalPendapatan() async {
    try {
      final pesanan =
          await pesananCollection.where('status', isEqualTo: 'Finished').get();
      double total = 0;
      pesanan.docs.forEach((doc) {
        PesananModel pesananModel =
            PesananModel.fromMap(doc.data() as Map<String, dynamic>);
        double harga = double.tryParse(pesananModel.harga) ?? 0;
        total += harga;
      });
      return total.toStringAsFixed(2);
    } catch (e) {
      print('Error while getting total pendapatan: $e');
      return '0';
    }
  }
}
