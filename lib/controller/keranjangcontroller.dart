import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class KeranjangController extends GetxController {
  CollectionReference beli = FirebaseFirestore.instance.collection('beli');
  int jumker = 0;
  List keranjang = [];
  List ker = [];
  List menunggu = [];
  List dikemas = [];
  List dikirm = [];
  List det = [];

  Stream<QuerySnapshot> getkeranjang(String email) {
    // print("tes");

    beli
        .where("email", isEqualTo: email)
        .orderBy("wak", descending: false)
        .snapshots()
        .listen(
      (querySnapshot) {
        // querySnapshot.docs.isEmpty
        // ? ada = false
        jumker = querySnapshot.docs.length;
        keranjang.clear();
        ker.clear();
        menunggu.clear();
        dikemas.clear();
        dikirm.clear();
        querySnapshot.docs.forEach(
          (res) {
            // keranjang.clear();
            // ada = true;
            // idmu = res.id;
            keranjang.add({
              'id': res.id,
              'alamat': res.data()['alamat'],
              'email': res.data()['email'],
              'harga': res.data()['harga'],
              'idbarang': res.data()['idbarang'],
              'jumpes': res.data()['jumpes'],
              'nama': res.data()['nama'],
              'nambar': res.data()['nambar'],
              'notelp': res.data()['notelp'],
              'status': res.data()['status'],
              'wak': res.data()['wak'],
              'gambar': res.data()['gambar'],
              'atasnama': res.data()['atasnama'],
              'resi': res.data()['resi'],
              'via': res.data()['via'],
              'desk': res.data()['desk'],
            });

            kernj();
            meng();
            dikms();
            dikrm();
            // print(keranjang.toString());
          },
        );

        update();
      },
    );
    update();
  }

  void kernj() {
    ker.clear();

    ker = keranjang
        .where((element) => element.toString().contains("Keranjang"))
        .toList();

    update();
  }

  void meng() {
    menunggu.clear();
    menunggu = keranjang
        .where((element) => element.toString().contains("Menunggu pembayaran"))
        .toList();
    update();
  }

  void dikms() {
    dikemas.clear();
    dikemas = keranjang
        .where((element) => element.toString().contains("Dikemas"))
        .toList();
    update();
  }

  void dikrm() {
    dikirm.clear();
    dikirm = keranjang
        .where((element) => element.toString().contains("Dikirim"))
        .toList();
    update();
  }

  void hapus({String id}) async {
    beli.doc(id).delete();
  }
}
