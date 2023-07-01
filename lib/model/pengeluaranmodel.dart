import 'dart:convert';

class PengeluaranModel {
  String? id;
  final DateTime tanggal;
  final String namabarang;
  final String hargabarang;
  PengeluaranModel({
    this.id,
    required this.tanggal,
    required this.namabarang,
    required this.hargabarang,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tanggal': tanggal.millisecondsSinceEpoch,
      'namabarang': namabarang,
      'hargabarang': hargabarang,
    };
  }

  factory PengeluaranModel.fromMap(Map<String, dynamic> map) {
    return PengeluaranModel(
      id: map['id'],
      tanggal: DateTime.fromMillisecondsSinceEpoch(map['tanggal']),
      namabarang: map['namabarang'] ?? '',
      hargabarang: map['hargabarang'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PengeluaranModel.fromJson(String source) =>
      PengeluaranModel.fromMap(json.decode(source));
}
