import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  CollectionReference dbnews = FirebaseFirestore.instance.collection('news');
  List news = [];
  Map newsdet = {};
  Map detine = {};
  Future<void> newpu() async {
    print(detine);
    int a = detine['data']['lihat'] + 1;
    dbnews.doc(detine['id']).update({'lihat': a});
    update();
  }

  Stream<DocumentSnapshot> getdetne({String id}) {
    detine.clear();
    dbnews.doc(id).snapshots().forEach(
      (res) {
        detine.clear();
        detine.addAll(
          {
            'id': res.id,
            'data': res.data(),
          },
        );
        // print(detine);
        update();
      },
    );
    update();
  }

  Stream<QuerySnapshot> getnews() {
    news.clear();
    dbnews.orderBy('tgl', descending: false).snapshots().listen((event) {
      news.clear();
      event.docs.forEach((res) {
        news.add({
          'id': res.id,
          'data': res.data(),
        });
        update();
        // print(news);
      });
      update();
    });
  }
}
