import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:futurebag/buttonbo.dart';
import 'package:futurebag/controller/kenalcontroller.dart';
import 'package:futurebag/style/widgtall.dart';

class Bungkuskenal extends StatefulWidget {
  @override
  _BungkuskenalState createState() => _BungkuskenalState();
}

class _BungkuskenalState extends State<Bungkuskenal> {
  final ser = FirebaseAuth.instance.currentUser;
  CollectionReference user = FirebaseFirestore.instance.collection('user');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: user.where('email', isEqualTo: ser.email).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.white,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        if (snapshot.data.docs == [] || snapshot.data.docs.isEmpty) {
          return Kenal(
            email: ser.email,
          );
          // return Datadiri(ser.email);
        }
        if (snapshot.data.docs.isNotEmpty) {
          // return B();
          return ButtonBo();
        }
        return Container(
          color: Colors.white,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

class Kenal extends StatefulWidget {
  final String email;
  Kenal({this.email});
  @override
  _KenalState createState() => _KenalState();
}

class _KenalState extends State<Kenal> {
  TextEditingController nama = TextEditingController();
  TextEditingController notlp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'mbo',
                    fontSize: 25,
                  ),
                  children: [
                    TextSpan(
                      text: "Kenalan dulu kuy",
                      style: TextStyle(),
                    ),
                    TextSpan(
                      text: " 🙃",
                    )
                  ],
                ),
              ),
              Text(
                "Tak kenal maka tak sayang.",
                style: TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                bawah(height: 20),
                fombor("Nama mu siapa?", "Bukan nama tetangga lo", (value) {
                  setState(() {});
                }, nama, Icons.account_circle_rounded, TextInputType.text),
                bawah(height: 30),
                fombor(
                  "Minta nomer telepon dong",
                  "Punya WA kan",
                  (value) {
                    setState(() {});
                  },
                  notlp,
                  Icons.phone,
                  TextInputType.number,
                ),
                bawah(height: 30),
                fombor(
                  "Kamu tinggal dimana?",
                  "Rt/Rw,Desa,Kecamatan,Kabupaten",
                  (value) {
                    setState(() {});
                  },
                  alamat,
                  Icons.pin_drop_rounded,
                  TextInputType.streetAddress,
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15),
          child: nama.text.length == 0 ||
                  notlp.text.length == 0 ||
                  alamat.text.length == 0
              ? tombolpan("Simpan", Colors.grey)
              : InkWell(
                  onTap: () {
                    KenalController.daftaruser(
                      email: widget.email,
                      nama: nama.text,
                      notelp: int.tryParse(notlp.text),
                      alamat: alamat.text,
                    );
                    // Get.dialog(
                    //   BackdropFilter(
                    //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    //     child: Dialog(
                    //       backgroundColor: Colors.transparent,
                    //       elevation: 0,
                    //       child: SizedBox(
                    //         width: 50,
                    //         height: 50,
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(2),
                    //           child: CircularProgressIndicator(
                    //             strokeWidth: 5,
                    //           ),
                    //         ),
                    //       ),
                    //       insetPadding: EdgeInsets.symmetric(
                    //         horizontal: 155,
                    //       ),
                    //     ),
                    //   ),
                    //   barrierColor: coblur,
                    //   barrierDismissible: false,
                    // );

                    // Future.delayed(Duration(milliseconds: 2000), () {
                    //   Get.to(ButtonBo(), transition: Transition.downToUp);
                    // });
                  },
                  child: tombolpan("Simpan", oren)),
        ),
      ),
    );
  }
}
