import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BanerController extends GetxController {
  List baner = [];
  CollectionReference dbaner = FirebaseFirestore.instance.collection('baner');
  Stream<QuerySnapshot> getbaner() {
    dbaner.snapshots().listen((event) {
      baner.clear();
      event.docs.forEach((res) {
        baner.add(res.data()['gambar']);
        // print(baner);
      });
      update();
    });
    update();
  }
}
