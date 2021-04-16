import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class LostConnection extends StatelessWidget {
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
                    width: Get.width / 1.8,
                    child: Image.asset(
                      "assets/lost.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  bawah(height: 20),
                  Column(
                    children: [
                      Text(
                        "Internetmu mati ya zeyeng",
                        style: TextStyle(
                          fontFamily: 'mbo',
                          fontSize: 18,
                        ),
                      ),
                      bawah(height: 5),
                      Text(
                        "Cek Internet atau WIFI dan coba lagi deh.",
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
