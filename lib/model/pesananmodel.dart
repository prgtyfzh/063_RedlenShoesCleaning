import 'dart:convert';

class PengeluaranModel {
  String? id;
  final String selectedDate;
  final String namapemilik;
  final String notelepon;
  final String sepatu;
  final String jenistreatment;
  final String harga;
  final String status;
  PengeluaranModel({
    this.id,
    required this.selectedDate,
    required this.namapemilik,
    required this.notelepon,
    required this.sepatu,
    required this.jenistreatment,
    required this.harga,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'selectedDate': selectedDate,
      'namapemilik': namapemilik,
      'notelepon': notelepon,
      'sepatu': sepatu,
      'jenistreatment': jenistreatment,
      'harga': harga,
      'status': status,
    };
  }

  factory PengeluaranModel.fromMap(Map<String, dynamic> map) {
    return PengeluaranModel(
      id: map['id'],
      selectedDate: map['selectedDate'] ?? '',
      namapemilik: map['namapemilik'] ?? '',
      notelepon: map['notelepon'] ?? '',
      sepatu: map['sepatu'] ?? '',
      jenistreatment: map['jenistreatment'] ?? '',
      harga: map['harga'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PengeluaranModel.fromJson(String source) =>
      PengeluaranModel.fromMap(json.decode(source));
}
