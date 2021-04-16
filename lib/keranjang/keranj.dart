import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:futurebag/controller/keranjangcontroller.dart';
import 'package:futurebag/keranjang/detailkeranj.dart';
import 'package:futurebag/keranjang/dialoghapus.dart';
import 'package:futurebag/keranjang/dikemas.dart';
import 'package:futurebag/keranjang/dikirim.dart';
import 'package:futurebag/keranjang/menunggu.dart';
import 'package:futurebag/style/stylekranjang.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class Keranj extends StatefulWidget {
  @override
  _KeranjState createState() => _KeranjState();
}

class _KeranjState extends State<Keranj> {
  
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: SizedBox(
          height: Get.height / 1.13,
          child: GetBuilder<KeranjangController>(
            init: KeranjangController(),
            builder: (val) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      elevation: 1,
                      floating: false,
                      pinned: true,
                      iconTheme: IconThemeData(
                        color: oren,
                      ),
                      backgroundColor: Colors.white,
                      actions: [
                        Center(
                          child: Text(
                            "Keranjang",
                            style: TextStyle(
                              fontFamily: 'mbo',
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, left: 10),
                          child: Center(
                              child: Icon(
                            Icons.shopping_cart_rounded,
                          )),
                        ),
                      ],
                    ),
                    val.ker.length == 0 || val.keranjang.length == 0
                        ? SliverToBoxAdapter(
                            child: Column(
                              children: [
                                Center(
                                  child: Image.asset("assets/chart.png",
                                      width: Get.width / 2,
                                      height: Get.width / 2),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Keranjang kok kosong ??",
                                      style: TextStyle(
                                        fontFamily: 'mbo',
                                        fontSize: 18,
                                      ),
                                    ),
                                    bawah(height: 5),
                                    Text(
                                      "Buruan pesen 100% buatan anak STMJ kok",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        : SliverToBoxAdapter(
                            child: Column(
                              children: [
                                // bawah(height: 15),

                                for (var a in val.ker)
                                  InkWell(
                                    onLongPress: () {
                                      Get.dialog(
                                        Dialog(
                                          child: DialogHapus(id: a['id']),
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                        ),
                                      );
                                    },
                                    onTap: () {
                                      Get.bottomSheet(
                                        DetailKeranj(
                                          id: a['id'],
                                        ),
                                        isScrollControlled: true,
                                        // barrierColor: Colors.transparent,
                                      );
                                    },
                                    child: StyleKeranjang(
                                      id: a['id'],
                                      // alamat: a['alamat'],
                                      // email: a['email'],
                                      harga: a['harga'],
                                      idbarang: a['idbarang'],
                                      jumpes: a['jumpes'],
                                      nama: a['nama'],
                                      nambar: a['nambar'],
                                      // notelp: a['notepl'],
                                      status: a['status'],
                                      wak: a['wak'],
                                      gambar: a['gambar'],
                                      // atasnama: a['atasnama'] == null
                                      //     ? ""
                                      //     : a['atasnama'],
                                      resi: a['resi'] == 0
                                          ? "Belumada resi"
                                          : a['resi'],
                                      via: a['via'] == 0
                                          ? "Belum ada"
                                          : a['via'],
                                      desk: a['desk'],
                                    ),
                                  )
                              ],
                            ),
                          )
                  ],
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endFloat,
                floatingActionButton: SizedBox(
                  height: 185,
                  child:
                      // GetBuilder<KeranjangController>(
                      //   init: KeranjangController(),
                      //   builder: (val) {
                      //     return
                      Column(
                    children: [
                      InkWell(
                          onTap: () {
                            Get.to(Menunggu());
                          },
                          child: gl(
                              Icons.attach_money_rounded, val.menunggu.length)),
                      bawah(height: 10),
                      InkWell(
                          onTap: () {
                            Get.to(Dikemas());
                          },
                          child: gl(Icons.inventory, val.dikemas.length)),
                      bawah(height: 10),
                      InkWell(
                          onTap: () {
                            Get.to(Dikirim());
                          },
                          child: gl(
                              Icons.local_shipping_rounded, val.dikirm.length)),
                    ],
                  ),
                  //   },
                  // )
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget gl(IconData ic, int jum) {
  return Container(
    width: 55,
    height: 55,
    decoration: BoxDecoration(
      color: oren,
      shape: BoxShape.circle,
    ),
    child: Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: oren,
              shape: BoxShape.circle,
            ),
            child: Icon(
              ic,
              color: Colors.white,
            ),
          ),
        ),
        jum == 0
            ? SizedBox(
                width: 0,
                height: 0,
              )
            : Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    jum > 20 ? "20+" : jum.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
      ],
    ),
  );
}
