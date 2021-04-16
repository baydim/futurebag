import 'package:flutter/material.dart';
import 'package:futurebag/style/detailbarang.dart';
import 'package:futurebag/style/curency.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

Widget kotakpanjang(
    {String id,
    String gambar,
    String nama,
    int harga,
    int hargaco,
    String desk,
    String kelas,
    int stock,
    bool hot}) {
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 10, right: 20),
    width: 290,
    height: 110,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          boxShadow1,
        ]),
    child: InkWell(
      onTap: () {
        Get.bottomSheet(
          Detailbarang(
            id: id,
            image: gambar,
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
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            child: Container(
              width: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              gambar,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Center(
                          child: Image.asset("assets/gandinit.png",
                              width: 40, height: 40, fit: BoxFit.contain),
                        ),
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
          ),
          Positioned(
            top: 7,
            bottom: 7,
            right: 0,
            left: 125,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama,
                      style: TextStyle(
                        fontFamily: 'mbo',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      maxLines: 2,
                    ),
                    bawah(height: 5),
                    Row(
                      children: [
                        Text(
                          curency.format(harga),
                          style: TextStyle(
                            fontFamily: 'mbo',
                            fontSize: 13,
                          ),
                        ),
                        samping(width: 10),
                        Text(
                          curency.format(hargaco),
                          style: TextStyle(
                            fontFamily: 'mbo',
                            fontSize: 13,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  desk,
                  style: TextStyle(
                    fontFamily: 'mb',
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget kso() {
  return Container(
    width: 290,
    height: 110,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          boxShadow1,
        ]),
    child: Row(
      children: [
        Image.asset(
          'assets/lebih.png',
          fit: BoxFit.fitHeight,
        ),
        samping(width: 15),
        Text(
          "Belum ada barang",
          style: TextStyle(
            fontFamily: 'mbo',
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        )
      ],
    ),
  );
}
