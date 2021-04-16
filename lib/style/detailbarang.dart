import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:futurebag/controller/belicontroller.dart';
import 'package:futurebag/controller/getdatadiri.dart';
import 'package:futurebag/keranjang/keranj.dart';
import 'package:futurebag/style/curency.dart';
import 'package:futurebag/style/plusmin.dart';
import 'package:futurebag/style/stokhabis.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class Detailbarang extends StatefulWidget {
  final String id;
  final String image;
  final String nama;
  final int harga;
  final int hargaco;
  final String desk;
  final String kelas;
  final int stock;
  final bool hot;
  Detailbarang(
      {this.id,
      this.image,
      this.nama,
      this.harga,
      this.hargaco,
      this.desk,
      this.kelas,
      this.stock,
      this.hot});
  @override
  _DetailbarangState createState() => _DetailbarangState();
}

class _DetailbarangState extends State<Detailbarang> {
  int jum = 1;
  int hargabel;
  @override
  void initState() {
    super.initState();
    hargabel = widget.harga;
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        padding: EdgeInsets.all(15),
        height: Get.height / 1.13,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // bawah(
            //   height: 10,
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                upbot(),
                bawah(
                  height: 10,
                ),
                Container(
                  width: Get.width,
                  height: Get.width - 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: oren),
                      color: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: Offset(
                            0,
                            5,
                          ),
                        ),
                      ]),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  widget.image,
                                  fit: BoxFit.cover,
                                ),
                                // Image.network(
                                //   widget.image,
                                //   fit: BoxFit.cover,
                                // ),
                              ),
                            ),
                            Center(
                              child: Image.asset(
                                "assets/gandinit.png",
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                curency.format(widget.harga),
                                style: TextStyle(
                                  fontFamily: 'mbo',
                                ),
                              ),
                              samping(width: 15),
                              Text(
                                (widget.hargaco == null)
                                    ? "Kosong"
                                    : curency.format(widget.hargaco),
                                style: TextStyle(
                                  fontFamily: 'mbo',
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      widget.hot
                          ? Positioned(
                              bottom: 7,
                              left: 10,
                              child: Stack(
                                children: [
                                  // Positioned(
                                  //   // left: 0,
                                  //   child: Container(
                                  //     margin: EdgeInsets.only(left: 0),
                                  //     padding: EdgeInsets.only(
                                  //         top: 3, left: 45, right: 15),
                                  //     height: 35,
                                  //     // width: 80,
                                  //     decoration: BoxDecoration(
                                  //         color: Colors.white,
                                  //         borderRadius:
                                  //             BorderRadius.circular(50),
                                  //         boxShadow: [
                                  //           BoxShadow(
                                  //             color:
                                  //                 Colors.black.withOpacity(0.2),
                                  //             blurRadius: 5,
                                  //           )
                                  //         ]),
                                  //     child: Center(
                                  //       child: Text(
                                  //         "Hot Sale",
                                  //         style: TextStyle(
                                  //           fontFamily: 'mbo',
                                  //           color: Colors.grey,
                                  //           fontSize: 12,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            blurRadius: 5,
                                          )
                                        ]),
                                    child: Icon(
                                      Icons.whatshot_rounded,
                                      // size: 18,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      Positioned(
                        top: 15,
                        right: 15,
                        child: Container(
                          height: 30,
                          padding: EdgeInsets.only(left: 10, right: 10, top: 2),
                          margin: EdgeInsets.only(right: 0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: oren,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              widget.kelas == null ? "Kosong" : widget.kelas,
                              style: TextStyle(
                                  color: oren, fontSize: 13, fontFamily: 'mbo'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                bawah(height: 25),
                Text(
                  widget.nama,
                  style: TextStyle(
                    fontFamily: 'mbo',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                bawah(height: 4),
                Text(
                  widget.desk,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 13,
                  ),
                  maxLines: 5,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Stock : ",
                      style: TextStyle(
                        fontFamily: 'mbo',
                      ),
                    ),
                    Text(widget.stock.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      curency.format(hargabel),
                      style: TextStyle(
                        fontFamily: 'mbo',
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (jum == 1) {
                                // print("mentok");
                              } else {
                                jum--;
                                hargabel = widget.harga * jum;
                              }
                            });
                          },
                          child: plusmin(
                            icon: Icons.remove_rounded,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            jum.toString(),
                            style: TextStyle(
                              fontFamily: 'mbo',
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(
                              () {
                                if (jum == widget.stock) {
                                  // print("mentok");
                                  Get.bottomSheet(
                                    Stockhabis(),
                                    isDismissible: false,
                                    // barrierColor: Colors.transparent,
                                    backgroundColor: Colors.transparent,
                                    enterBottomSheetDuration:
                                        Duration(milliseconds: 100),
                                    exitBottomSheetDuration:
                                        Duration(milliseconds: 100),
                                  );
                                } else {
                                  jum++;
                                  hargabel = widget.harga * jum;
                                }
                              },
                            );
                          },
                          child: plusmin(
                            icon: Icons.add_rounded,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                bawah(height: 15),
                GetBuilder<GetDataDiri>(
                  init: GetDataDiri(),
                  builder: (val) => InkWell(
                      onTap: () {
                        DateTime no = DateTime.now();
                        // if (Get.isBottomSheetOpen) Get.back();
                        Beli.keranjang(
                          nambar: widget.nama,
                          alamat: val.datadiri['alamat'],
                          email: val.datadiri['email'],
                          harga: hargabel,
                          idbarang: widget.id,
                          jumpes: jum,
                          nama: val.datadiri['nama'],
                          notelp: val.datadiri['nomor_tlp'].toString(),
                          wak: no,
                          gambar: widget.image,
                          desk: widget.desk,
                        );
                        Get.rawSnackbar(
                          snackPosition: SnackPosition.TOP,
                          forwardAnimationCurve: Curves.bounceInOut,
                          reverseAnimationCurve: Curves.bounceIn,
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.all(0),
                          messageText: Container(
                            padding: EdgeInsets.only(right: 15),
                            height: 50,
                            color: Colors.transparent,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  // print("hmmm");
                                  if (Get.isSnackbarOpen) Get.back();
                                  if (Get.isBottomSheetOpen) Get.back();
                                  Future.delayed(Duration(milliseconds: 500),
                                      () {
                                    Get.to(
                                      Keranj(),
                                      // isScrollControlled: true,
                                      // ignoreSafeArea: true,
                                    );
                                    // Get.to(Keranj(),
                                    //     transition: Transition.downToUp);
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade300,
                                        )
                                      ]),
                                  child: Icon(
                                    Icons.shopping_cart_rounded,
                                    color: oren,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // duration: Duration(milliseconds: 500),
                        );
                      },
                      child: tombolpan("Keranjang", oren)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
