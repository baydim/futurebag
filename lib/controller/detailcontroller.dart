import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  CollectionReference beli = FirebaseFirestore.instance.collection('beli');
  List detil = [];

  Stream<DocumentSnapshot> getdetailj({String id}) {
    detil.clear();
    beli.doc(id).snapshots().listen(
      (res) {
        // int jum = querySnapshot.docs.length;
        detil.clear();
        detil.add({'id': res.id, 'data': res.data()});
        // print(detil);
        update();
      },
    );
    // print("dapat data");
    update();
  }
}
