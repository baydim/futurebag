import 'package:flutter/material.dart';
import 'package:futurebag/auth/daftar.dart';
import 'package:futurebag/auth/masuk.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class Wrapauth extends StatefulWidget {
  @override
  _WrapauthState createState() => _WrapauthState();
}

class _WrapauthState extends State<Wrapauth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 55,
        leadingWidth: 50,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 35,
                  child: Image.asset("assets/gandini.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Gandini",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: " Store",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bawah(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: SizedBox(
                    width: Get.width,
                    child: Image.asset(
                      'assets/a.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  "Selamat datang di GStore !",
                  style: TextStyle(
                    fontFamily: 'mbo',
                    fontSize: 25,
                  ),
                ),
                bawah(height: 10),
                Text(
                  "Aplikasi buatan anak STMJ PONOROGO bertujuan untuk menyalurkan produk hasil kerja para siswa Sekolah Menengah Kejuruan.",
                  style: TextStyle(
                    fontFamily: 'mb',
                    fontSize: 13,
                    letterSpacing: 0.2,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            Masuk(),
                            isScrollControlled: true,
                          );
                        },
                        child: tombolauth("Masuk")),
                    InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            Daftar(),
                            isScrollControlled: true,
                          );
                        },
                        child: tombolauth("Daftar")),
                  ],
                ),
                bawah(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 13,
                    ),
                    children: [
                      TextSpan(
                        text: "Dengan masuk atau mendaftar, kamu menyetujui ",
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: "Ketentuan Layanan ",
                        style: TextStyle(color: oren),
                      ),
                      TextSpan(
                        text: "dan",
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: " Kebijakan privasi.",
                        style: TextStyle(color: oren),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
