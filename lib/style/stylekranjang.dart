import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:futurebag/style/curency.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class StyleKeranjang extends StatefulWidget {
  final String id;
  // final String alamat;
  // final String email;
  final int harga;
  final String idbarang;
  final int jumpes;
  final String nama;
  final String nambar;
  // final String notelp;
  final String status;
  final Timestamp wak;
  final String gambar;
  // final String atasnama;
  final String resi;
  final String via;
  final String desk;
  StyleKeranjang({
    this.id,
    // this.alamat,
    // this.email,
    this.harga,
    this.idbarang,
    this.jumpes,
    this.nama,
    this.nambar,
    // this.notelp,
    this.status,
    this.wak,
    this.gambar,
    // this.atasnama,
    this.resi,
    this.via,
    this.desk,
  });

  @override
  _StyleKeranjangState createState() => _StyleKeranjangState();
}

class _StyleKeranjangState extends State<StyleKeranjang> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 25, left: 15, right: 15, top: 25),
          // padding: EdgeInsets.all(15),
          width: Get.width,
          height: 90,
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width - 140,
                // padding: EdgeInsets.only(bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.nambar,
                          style: TextStyle(
                            fontFamily: 'mbo',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        bawah(height: 5),
                        Text(
                          widget.desk != null ? widget.desk : "",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                    bawah(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // samping(width: 15),
                        Text(
                          widget.status,
                          style: TextStyle(
                            fontFamily: 'mbo',
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          curency.format(widget.harga),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Image.network(
                          widget.gambar,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(15),
                          // ),
                          color: oren,
                        ),
                        child: Text(
                          widget.jumpes.toString(),
                          style: TextStyle(
                            fontFamily: "mbo",
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.grey.withOpacity(0.3),
          height: 0,
        )
      ],
    );
  }
}
