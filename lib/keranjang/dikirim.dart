import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:futurebag/controller/keranjangcontroller.dart';
import 'package:futurebag/keranjang/detailkeranj.dart';
import 'package:futurebag/style/stylekranjang.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class Dikirim extends StatefulWidget {
  @override
  _DikirimState createState() => _DikirimState();
}

class _DikirimState extends State<Dikirim> {
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
                            "Dikirim",
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
                            Icons.local_shipping_rounded,
                          )),
                        ),
                      ],
                    ),
                    val.dikirm.length == 0
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
                                      "Tidak ada pengiriman",
                                      style: TextStyle(
                                        fontFamily: 'mbo',
                                        fontSize: 18,
                                      ),
                                    ),
                                    bawah(height: 5),
                                    Text(
                                      "Hah kok sepi",
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

                                for (var a in val.dikirm)
                                  InkWell(
                                    // onLongPress: () {

                                    // },
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
                // floatingActionButtonLocation:
                //     FloatingActionButtonLocation.endFloat,
                // floatingActionButton: SizedBox(
                //     height: 185,
                //     child: GetBuilder<KeranjangController>(
                //       init: KeranjangController(),
                //       builder: (val) {
                //         return Column(
                //           children: [
                //             gl(Icons.attach_money_rounded, val.menunggu.length),
                //             bawah(height: 10),
                //             gl(Icons.inventory, val.dikemas.length),
                //             bawah(height: 10),
                //             gl(Icons.local_shipping_rounded, val.dikirm.length),
                //           ],
                //         );
                //       },
                //     )),
              );
            },
          ),
        ),
      ),
    );
  }
}
