import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futurebag/controller/detailcontroller.dart';
import 'package:futurebag/keranjang/lacakresi.dart';
import 'package:futurebag/style/curency.dart';
import 'package:futurebag/style/infopembayaran.dart';
import 'package:futurebag/style/rules.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:futurebag/tesgambar.dart';
import 'package:get/get.dart';

class DetailKeranj extends StatefulWidget {
  final String id;
  DetailKeranj({this.id});
  @override
  _DetailKeranjState createState() => _DetailKeranjState();
}

class _DetailKeranjState extends State<DetailKeranj> {
  DetailController detailController = Get.put(DetailController());
  TextEditingController atasnama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  String id;
  String stat;
  var da;
  @override
  void initState() {
    super.initState();

    detailController.getdetailj(id: widget.id);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    detailController.getdetailj(id: widget.id);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: GetBuilder<DetailController>(
          init: DetailController(),
          builder: (val) {
            // stat = val.['data']['status'];
            return SizedBox(
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    right: 15,
                    child: InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          // Container(
                          //   color: Colors.white,
                          // ),
                          InfoPembayaran(),
                          isScrollControlled: true,
                        );
                      },
                      child: Icon(
                        Icons.info_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  for (var b in val.detil)
                    b['data']['status'] == "Dikirim" ||
                            b['data']['status'] == "Dikemas"
                        ? b['data']['resi'] == null || b['data']['via'] == null
                            ? Positioned(
                                bottom: Get.height / 2 + 15,
                                right: 15,
                                left: 15,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (Get.isBottomSheetOpen)
                                              Get.back();
                                            Future.delayed(
                                                Duration(milliseconds: 500),
                                                () {
                                              Get.to(
                                                Kap(
                                                  id: widget.id,
                                                ),
                                              );
                                            });
                                          },
                                          child: Container(
                                            height: 55,
                                            width: 55,
                                            decoration: BoxDecoration(
                                                color: oren,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.image,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        samping(width: 10),
                                        Text(
                                          "Struk",
                                          style: TextStyle(
                                            fontFamily: 'mbo',
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Text(
                                    //       "Struk",
                                    //       style: TextStyle(
                                    //         fontFamily: 'mbo',
                                    //         color: Colors.white,
                                    //       ),
                                    //     ),
                                    //     samping(width: 10),
                                    //     Container(
                                    //       height: 55,
                                    //       width: 55,
                                    //       decoration: BoxDecoration(
                                    //           color: oren,
                                    //           shape: BoxShape.circle),
                                    //       child: Icon(
                                    //         Icons.image,
                                    //         color: Colors.white,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // )
                                  ],
                                ),
                              )
                            : Positioned(
                                bottom: Get.height / 2 + 15,
                                right: 15,
                                left: 15,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (Get.isBottomSheetOpen)
                                              Get.back();
                                            Future.delayed(
                                                Duration(milliseconds: 500),
                                                () {
                                              Get.to(
                                                Kap(
                                                  id: widget.id,
                                                ),
                                              );
                                            });
                                          },
                                          child: Container(
                                            height: 55,
                                            width: 55,
                                            decoration: BoxDecoration(
                                                color: oren,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.image,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        samping(width: 10),
                                        Text(
                                          "Struk",
                                          style: TextStyle(
                                            fontFamily: 'mbo',
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (Get.isBottomSheetOpen) Get.back();
                                        Future.delayed(
                                            Duration(milliseconds: 500), () {
                                          Get.to(
                                            LacakResi(
                                              resi: b['data']['resi'],
                                              via: b['data']['via'],
                                            ),
                                          );
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            b['data']['via'],
                                            style: TextStyle(
                                              fontFamily: 'mbo',
                                              color: Colors.white,
                                            ),
                                          ),
                                          samping(width: 10),
                                          Container(
                                            height: 55,
                                            width: 55,
                                            decoration: BoxDecoration(
                                                color: oren,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.local_shipping_rounded,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                        // Positioned(
                        //     bottom: Get.height / 2 + 15,
                        //     right: 15,
                        //     child: Text("hmmm"))
                        // ?
                        // Positioned(
                        //     bottom: Get.height / 2 + 15,
                        //     right: 15,
                        //     child: InkWell(
                        //       onTap: () {
                        //         if (Get.isBottomSheetOpen) Get.back();
                        //         Get.to(
                        //           LacakResi(
                        //             resi: b['data']['resi'],
                        //             via: b['data']['via'],
                        //           ),
                        //         );
                        //       },
                        //       child: Row(
                        //         children: [
                        //           Container(
                        //             height: 40,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(100),
                        //             ),
                        //             child: Center(
                        //               child: Text(
                        //                 b['data']['via'],
                        //                 style: TextStyle(
                        //                     fontFamily: 'mbo',
                        //                     color: Colors.white),
                        //               ),
                        //             ),
                        //           ),
                        //           samping(width: 10),
                        //           Container(
                        //             width: 55,
                        //             height: 55,
                        //             decoration: BoxDecoration(
                        //                 color: oren, shape: BoxShape.circle),
                        //             child: Icon(Icons.local_shipping_rounded,
                        //                 color: Colors.white),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   )
                        : Positioned(
                            top: 0,
                            child: SizedBox(
                              height: 0,
                              width: 0,
                            ),
                          ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        bawah(height: 10),
                        Container(
                          width: Get.width,
                          height: Get.height / 2,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var a in val.detil)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.network(
                                              a['data']['gambar'],
                                              fit: BoxFit.cover,
                                              width: 90,
                                              height: 90,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 15,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: Get.width / 2,
                                                  child: Text(
                                                    a['data']['nambar'],
                                                    style: TextStyle(
                                                      fontFamily: 'mbo',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                                bawah(
                                                  height: 5,
                                                ),
                                                Container(
                                                  width: Get.width / 2,
                                                  child: Text(
                                                    a['data']['desk'] == null
                                                        ? ""
                                                        : a['data']['desk'],
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.grey,
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                                bawah(
                                                  height: 15,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Jumlah pesanan :"),
                                                    Text(
                                                      curency.format(
                                                        a['data']['jumpes'],
                                                      ),
                                                      style: TextStyle(
                                                        fontFamily: 'mbo',
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                bawah(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Total harga :"),
                                                    Text(
                                                      curency.format(
                                                        a['data']['harga'],
                                                      ),
                                                      style: TextStyle(
                                                        fontFamily: 'mbo',
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      // TextField(
                                      //   controller: atasnama,
                                      // ),

                                      bawah(height: 30),
                                      a['data']['status'] != "Keranjang"
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Nama penerima",
                                                  style: TextStyle(
                                                    fontFamily: 'mbo',
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                bawah(
                                                  height: 10,
                                                ),
                                                Text(a['data']['atasnama'])
                                              ],
                                            )
                                          : fombor("Atas nama siapa ya ?",
                                              "Atas nama", (value) {
                                              setState(() {});
                                            },
                                              atasnama,
                                              Icons.account_circle_rounded,
                                              TextInputType.text),
                                      bawah(height: 15),
                                      a['data']['status'] != "Keranjang"
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Alamat penerima",
                                                  style: TextStyle(
                                                    fontFamily: 'mbo',
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                bawah(
                                                  height: 10,
                                                ),
                                                Text(a['data']['alamat'])
                                              ],
                                            )
                                          : fombor("Masukan alamat spesifik ya",
                                              "Rt/Rw,Desa,Kecamatan,Kabupaten",
                                              (value) {
                                              setState(() {});
                                            }, alamat, Icons.pin_drop_rounded,
                                              TextInputType.text),
                                      bawah(
                                        height: 15,
                                      ),
                                      a['data']['resi'] != null &&
                                              a['data']['resi'] != ''
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Nomer resi",
                                                      style: TextStyle(
                                                        fontFamily: 'mbo',
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    bawah(height: 5),
                                                    Text(a['data']['resi'] ==
                                                            null
                                                        ? ""
                                                        : a['data']['resi']),
                                                  ],
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Clipboard.setData(
                                                      new ClipboardData(
                                                          text: a['data']
                                                              ['resi']),
                                                    );
                                                    if (ClipboardStatus
                                                            .pasteable !=
                                                        null) {
                                                      Get.rawSnackbar(
                                                          forwardAnimationCurve:
                                                              Curves
                                                                  .elasticInOut,
                                                          reverseAnimationCurve:
                                                              Curves.elasticOut,
                                                          margin:
                                                              EdgeInsets.all(
                                                                  15),
                                                          borderRadius: 20,
                                                          backgroundColor: oren,
                                                          overlayColor:
                                                              Colors.white,
                                                          message: "Disalin");
                                                    }
                                                  },
                                                  child: Text("Salin"),
                                                )
                                              ],
                                            )
                                          : bawah(height: 30),

                                      a['data']['status'] != "Keranjang"
                                          ? Column(
                                              children: [
                                                bawah(height: 30),
                                                InkWell(
                                                  onTap: () {
                                                    if (Get.isBottomSheetOpen)
                                                      Get.back();
                                                    // Get.back();
                                                    Get.to(
                                                      Rulesa(
                                                        id: widget.id,
                                                        nambarang: a['data']
                                                            ['nambar'],
                                                        jum: a['data']
                                                            ['jumpes'],
                                                        napem: a['data']
                                                            ['nama'],
                                                        alpem: alamat.text,
                                                        empem: a['data']
                                                            ['email'],
                                                      ),
                                                    );
                                                    // print("lah");
                                                  },
                                                  child: tombolpan(
                                                      "Kirim bukti pembayaran",
                                                      Colors.grey),
                                                ),
                                              ],
                                            )
                                          : atasnama.text.length == 0 ||
                                                  alamat.text.length == 0
                                              ? tombolpan(
                                                  "Bayar sekarang", Colors.grey)
                                              : InkWell(
                                                  onTap: () {
                                                    Get.bottomSheet(
                                                      Rules(
                                                        id: widget.id,
                                                        nambarang: a['data']
                                                            ['nambar'],
                                                        jum: a['data']
                                                            ['jumpes'],
                                                        napem: atasnama.text,
                                                        alpem: alamat.text,
                                                        empem: a['data']
                                                            ['email'],
                                                      ),
                                                    );
                                                    // Beli.ambil(widget.id,
                                                    //     atasnama: atasnama.text,
                                                    //     alamat: alamat.text);
                                                    // Get.back();
                                                  },
                                                  child: tombolpan(
                                                      "Bayar sekarang", oren),
                                                )
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
