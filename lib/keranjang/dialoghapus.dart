import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:futurebag/controller/keranjangcontroller.dart';
import 'package:get/get.dart';

class DialogHapus extends StatefulWidget {
  final String id;
  DialogHapus({this.id});
  @override
  _DialogHapusState createState() => _DialogHapusState();
}

class _DialogHapusState extends State<DialogHapus> {
  KeranjangController barangController = Get.put(KeranjangController());
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        padding: EdgeInsets.all(15),
        height: 250,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Image.asset(
                'assets/menuggu.png',
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "Item akan dihapus",
              style: TextStyle(fontFamily: 'mbo', fontSize: 15),
            ),
            InkWell(
              onTap: () {
                barangController.hapus(id: widget.id);
                if (Get.isDialogOpen) Get.back();
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                width: Get.width,
                child: Center(
                  child: Text(
                    "Hapus",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
