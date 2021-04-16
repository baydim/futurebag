import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:futurebag/style/bottomnotif.dart';
import 'package:futurebag/style/loading.dart';
import 'package:get/get.dart';

class Acontroller extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  String msg;

  masuk({String email, String pass}) async {
    if (Get.isBottomSheetOpen) Get.back();
    Get.dialog(
      Dialog(
        child: loading(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
    //////
    msg = null;
    try {
      final res =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      User user = res.user;
      if (Get.isDialogOpen) Get.back();
      if (Get.isBottomSheetOpen) Get.back();
      return user;
    } on FirebaseAuthException catch (e) {
      if (Get.isDialogOpen) Get.back();
      if (Get.isBottomSheetOpen) Get.back();
      Future.delayed(
        Duration(milliseconds: 500),
        () {
          if (e.code == "invalid-email")
            Get.bottomSheet(
              BottomNotif(
                gambar: 'assets/bin.png',
                judul: "Emailmu salah lo ini",
                desk: "Pakai format yang bener ya ",
              ),
            );
          if (e.code == "wrong-password")
            Get.bottomSheet(
              BottomNotif(
                gambar: 'assets/bin.png',
                judul: "Passwordnya salah",
                desk: "Coba inget pelan-pelan passwordnya",
              ),
            );
          if (e.code == "user-not-found")
            Get.bottomSheet(
              BottomNotif(
                gambar: 'assets/bin.png',
                judul: "Daftar dulu kih",
                desk: "Aku belum kenal lo ini",
              ),
            );
        },
      );

      print(e.code);

      return null;
    } catch (e) {
      print(e);
    }
    update();
  }

//
  ///
/////
  ///
  ///
  ///
  ///
  ///
  ///
  ////////
  daftar({String email, String pass}) async {
    if (Get.isBottomSheetOpen) Get.back();
    Get.dialog(
      Dialog(
        child: loading(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
    try {
      final res = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      User user = res.user;
      if (Get.isDialogOpen) Get.back();
      if (Get.isBottomSheetOpen) Get.back();
      return user;
    } on FirebaseAuthException catch (e) {
      if (Get.isDialogOpen) Get.back();
      if (Get.isBottomSheetOpen) Get.back();
      Future.delayed(
        Duration(milliseconds: 500),
        () {
          if (e.code == "invalid-email")
            Get.bottomSheet(
              BottomNotif(
                gambar: 'assets/bin.png',
                judul: "Emailmu salah lo ini",
                desk: "Pakai format yang bener ya ",
              ),
            );
          if (e.code == "weak-password")
            Get.bottomSheet(
              BottomNotif(
                gambar: 'assets/bin.png',
                judul: "Password kurang panjang",
                desk: "Password harus lebih dari 6 karakter lo",
              ),
            );
          if (e.code == "email-already-in-use")
            Get.bottomSheet(
              BottomNotif(
                gambar: 'assets/bin.png',
                judul: "Email ini udah digunain",
                desk: "Kamu tidak bisa daftar, karena dah masuk kesini",
              ),
            );
        },
      );

      print(e.code);
      print(e.message);

      return null;
    } catch (e) {
      print(e);
    }
    update();
  }

  void out() {
    auth.signOut();
  }
}
