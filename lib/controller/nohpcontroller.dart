import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class NohpController extends GetxController {
  Map nohp = {};
  CollectionReference dbaner = FirebaseFirestore.instance.collection('nohp');
  Stream<QuerySnapshot> getnohp() {
    dbaner.snapshots().listen((event) {
      nohp.clear();
      event.docs.forEach((res) {
        nohp.addAll(res.data());
        // print(baner);
      });
      update();
    });
    update();
  }
}
