import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:futurebag/style/kelas.dart';
import 'package:get/get.dart';

class BarangController extends GetxController {
  CollectionReference dbbarang =
      FirebaseFirestore.instance.collection('barang');
  List barang = [];
  Stream<QuerySnapshot> getbarang() {
    barang.clear();
    dbbarang.orderBy('create_at', descending: false).snapshots().listen(
      (querySnapshot) {
        // int jum = querySnapshot.docs.length;
        barang.clear();
        querySnapshot.docs.forEach(
          (res) {
            barang.add(
              {
                'id': res.id,
                'create_at': res.data()['create_at'],
                'deskripsi': res.data()['deskripsi'],
                'gambar': res.data()['gambar'],
                'harga': res.data()['harga'],
                'hargacoret': res.data()['hargacoret'],
                'kelas': res.data()['kelas'],
                'nama': res.data()['nama'],
                'stock': res.data()['stock'],
                'hot': res.data()['hot'],
              },
            );
            getrpl();
            getpe();
            gettpeng();
            getdpib();
            getbsm();
            getei();
            getoi();
            gettptu();
            // print(rpl);
          },
        );
      },
    );
    // print("dapat data");
    update();
  }

  List temu = [];
  void cari(String t) async {
    temu = barang
        .where((element) => element.toString().contains(t.toString()))
        .toList();
    update();
  }

  List hotrpl = [];
  List rpl = [];
  void getrpl() async {
    rpl.clear();
    hotrpl.clear();
    rpl = barang
        .where((element) => element.toString().contains(kategori[0].toString()))
        .toList();
    hotrpl =
        rpl.where((element) => element.toString().contains('true')).toList();
    // print("ini hot rpl");
    // print(hotrpl);
    update();
  }

  List tpemesinan = [];
  List hotpemesinan = [];
  void getpe() async {
    tpemesinan.clear();
    hotpemesinan.clear();
    tpemesinan = barang
        .where((element) => element.toString().contains(kategori[1].toString()))
        .toList();
    hotpemesinan = tpemesinan
        .where((element) => element.toString().contains('true'))
        .toList();
    update();
  }

  List tpengelasan = [];
  List hotpengelasan = [];
  void gettpeng() async {
    tpengelasan.clear();
    hotpengelasan.clear();
    tpengelasan = barang
        .where((element) => element.toString().contains(kategori[2].toString()))
        .toList();
    hotpengelasan = tpengelasan
        .where((element) => element.toString().contains('true'))
        .toList();
    update();
  }

  List dpib = [];
  List hotdpib = [];
  void getdpib() async {
    dpib.clear();
    hotdpib.clear();
    dpib = barang
        .where((element) => element.toString().contains(kategori[3].toString()))
        .toList();
    hotdpib =
        dpib.where((element) => element.toString().contains('true')).toList();
    update();
  }

  List tbsm = [];
  List hotbsm = [];

  void getbsm() async {
    tbsm.clear();
    hotbsm.clear();
    tbsm = barang
        .where((element) => element.toString().contains(kategori[4].toString()))
        .toList();
    hotbsm =
        tbsm.where((element) => element.toString().contains('true')).toList();
    update();
  }

  List ei = [];
  List hotei = [];
  void getei() async {
    ei.clear();
    hotei.clear();
    ei = barang
        .where((element) => element.toString().contains(kategori[5].toString()))
        .toList();
    hotei = ei.where((element) => element.toString().contains('true')).toList();
    update();
  }

  List oi = [];
  List hotoi = [];
  void getoi() async {
    oi.clear();
    hotoi.clear();
    oi = barang
        .where((element) => element.toString().contains(kategori[6].toString()))
        .toList();
    hotoi = oi.where((element) => element.toString().contains('true')).toList();
    update();
  }

  List tptu = [];
  List hotptu = [];
  void gettptu() async {
    tptu.clear();
    hotptu.clear();
    tptu = barang
        .where((element) => element.toString().contains(kategori[7].toString()))
        .toList();
    hotptu =
        tptu.where((element) => element.toString().contains('true')).toList();
    update();
  }
}
