import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Us {
  static final ser = FirebaseAuth.instance.currentUser;
}

class GetDataDiri extends GetxController {
  final ser = Us.ser;
  CollectionReference user = FirebaseFirestore.instance.collection('user');
  Map datadiri;
  String idku;
  void editno(String a) {
    user.doc(idku).update({'nomor_tlp': a});
  }

  void editna(String a) {
    user.doc(idku).update({'nama': a});
  }

  void edital(String a) {
    user.doc(idku).update({'alamat': a});
  }

  // @override
  // void onInit() {
  //   super.onInit();
  Stream<QuerySnapshot> getaku(String email) {
    // print("tes");
    user.where("email", isEqualTo: email).snapshots().listen(
      (querySnapshot) {
        // querySnapshot.docs.isEmpty
        // ? ada = false
        querySnapshot.docs.forEach(
          (res) {
            // ada = true;
            // idmu = res.id;
            idku = res.id;
            datadiri = res.data();
            print(idku);
            // print(datadiri.toString());
          },
        );
        update();
      },
    );
    update();
  }
  // }
}
