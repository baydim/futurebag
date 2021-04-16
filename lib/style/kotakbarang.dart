import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:futurebag/style/curency.dart';
import 'package:futurebag/style/detailbarang.dart';
import 'package:futurebag/style/stokhabis.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

Widget kotakbarang(
  String id,
  String image,
  String nama,
  int harga,
  int hargaco,
  String desk,
  String kelas,
  int stock,
  bool hot,
) {
  return InkWell(
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    focusColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () {
      stock == 0
          ? Get.bottomSheet(Stockhabis())
          : Get.bottomSheet(
              Detailbarang(
                id: id,
                image: image,
                nama: nama,
                harga: harga,
                hargaco: hargaco,
                desk: desk,
                kelas: kelas,
                stock: stock,
                hot: hot,
              ),
              isScrollControlled: true,
            );
    },
    child: Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
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
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          'assets/gandinit.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ),
                hot
                    ? Positioned(
                        bottom: 7,
                        left: 7,
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 5,
                                )
                              ]),
                          child: Icon(
                            Icons.whatshot_rounded,
                            size: 18,
                            color: Colors.red,
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 0,
                        width: 0,
                      )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: TextStyle(
                    fontFamily: 'mbo',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: stock != 0 ? Colors.black : Colors.red),
                maxLines: 2,
              ),
              bawah(height: 10),
              Row(
                children: [
                  Text(
                    curency.format(harga),
                    style: TextStyle(
                        fontFamily: 'mbo',
                        fontSize: 13,
                        color: stock != 0 ? Colors.black : Colors.red),
                  ),
                  samping(width: 10),
                  Text(
                    curency.format(hargaco),
                    style: TextStyle(
                      fontFamily: 'mbo',
                      fontSize: 13,
                      decoration: TextDecoration.lineThrough,
                      color: stock != 0
                          ? Colors.grey
                          : Colors.red.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: Get.width,
            padding: EdgeInsets.only(top: 2),
            height: 25,
            decoration: BoxDecoration(
              border:
                  Border.all(color: stock != 0 ? oren : Colors.red, width: 1.3),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                stock != 0 ? "Lihat" : "Habis",
                style: TextStyle(
                  fontFamily: 'mbo',
                  color: stock != 0 ? oren : Colors.red,
                  fontSize: 13,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
