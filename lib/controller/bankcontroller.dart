import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BankController extends GetxController {
  Map bank = {};
  CollectionReference dbaner = FirebaseFirestore.instance.collection('bank');
  Stream<QuerySnapshot> getbank() {
    dbaner.snapshots().listen((event) {
      bank.clear();
      event.docs.forEach((res) {
        bank.addAll(res.data());
        // print(baner);
      });
      update();
    });
    update();
  }
}
