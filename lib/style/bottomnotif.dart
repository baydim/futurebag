import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class BottomNotif extends StatefulWidget {
  final String gambar;
  final String judul;
  final String desk;
  BottomNotif({this.gambar, this.judul, this.desk});
  @override
  _BottomNotifState createState() => _BottomNotifState();
}

class _BottomNotifState extends State<BottomNotif> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        padding: EdgeInsets.all(15),
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            upbot(),
            bawah(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.width / 1.5,
                    child: Image.asset(
                      widget.gambar,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  bawah(height: 20),
                  Column(
                    children: [
                      Text(
                        widget.judul,
                        style: TextStyle(
                          fontFamily: 'mbo',
                          fontSize: 18,
                        ),
                      ),
                      bawah(height: 5),
                      Text(
                        widget.desk,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
