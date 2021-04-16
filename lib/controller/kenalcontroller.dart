import 'package:cloud_firestore/cloud_firestore.dart';

class KenalController {
  static CollectionReference user =
      FirebaseFirestore.instance.collection('user');

  static Future<void> daftaruser({
    String nama,
    int notelp,
    String email,
    String alamat,
  }) async {
    await user.add({
      'nama': nama,
      'nomor_tlp': notelp,
      'email': email,
      'alamat': alamat,
    });
  }
}
