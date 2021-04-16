import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futurebag/controller/modelresi.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ResiController extends GetxController {
  String keyres;
  ModelResi modelRes;
  bool lo = true;
  CollectionReference k = FirebaseFirestore.instance.collection('resikey');
    void getlo() {
    lo = true;
    update();
  }
  Stream<DocumentSnapshot> getkeyres() {
    k.doc("1").snapshots().listen((event) {
      keyres = event.data()['res'];
      print(keyres);
      update();
    });
    update();
  }

  void getres(String a, String b) async {
    // print(a + b);
    // String key =
    //     "e829dd0de9f02fdb29dfdfae5581a0e767c39877fc8bde4c5cfa1768c377c3d5";
    String url =
        "https://api.binderbyte.com/v1/track?api_key=$keyres&courier=$a&awb=$b";
    final res = await http.get(url);
    if (res.statusCode == 200) {
      // modelRes = null;
      final modelResi = modelResiFromMap(res.body);
      print("ini model resi");
      
      print(modelResi.message);
      modelRes = modelResi;
      lo = false;
      update();
    } else {
      Get.back();
      Get.dialog(
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Resi tidak terdaftar",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      lo = true;
    }
    update();
  }
  void hapres() {
    modelRes = null;
    update();
  }
}
