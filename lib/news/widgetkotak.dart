import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:futurebag/controller/newscontroller.dart';
import 'package:futurebag/news/detilnews.dart';
import 'package:futurebag/style/dateformat.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class Widgetkotak extends StatefulWidget {
  final String id;
  final String gambar;
  final String judul;
  final String isi;
  final DateTime tgl;
  final int lihat;
  Widgetkotak(
      {this.id, this.gambar, this.judul, this.isi, this.tgl, this.lihat});

  @override
  _WidgetkotakState createState() => _WidgetkotakState();
}

class _WidgetkotakState extends State<Widgetkotak> {
  NewsController n = Get.put(NewsController());
  double b = Get.width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        n.getdetne(id: widget.id);
        Get.to(DetilNews());
      },
      onLongPress: () {
        Get.dialog(
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.gambar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          transitionCurve: Curves.decelerate,
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
        width: Get.width,
        // height: Get.width,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                blurRadius: 10, spreadRadius: 1, color: Colors.grey.shade300),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.gambar,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.network(
                  widget.gambar,
                  width: Get.width,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            samping(width: 10),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.judul,
                    style: TextStyle(
                      fontFamily: 'mn',
                      fontSize: 16,
                    ),
                    maxLines: 1,
                  ),
                  bawah(height: 7),
                  Container(
                    width: Get.width,
                    child: Text(
                      widget.isi,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      maxLines: 3,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dateformat.format(widget.tgl).split("%")[0],
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    widget.lihat.toString() + "X dilihat",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetKotakecil extends StatefulWidget {
  final String id;
  final String gambar;
  final String judul;
  final String isi;
  final DateTime tgl;
  final int lihat;
  WidgetKotakecil(
      {this.id, this.gambar, this.judul, this.isi, this.tgl, this.lihat});
  @override
  _WidgetKotakecilState createState() => _WidgetKotakecilState();
}

class _WidgetKotakecilState extends State<WidgetKotakecil> {
  NewsController n = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        n.getdetne(id: widget.id);
        Get.to(DetilNews());
      },
      onLongPress: () {
        Get.dialog(
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.gambar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          transitionCurve: Curves.decelerate,
        );
      },
      child: Container(
        width: 180,
        height: 180,
        margin: EdgeInsets.only(right: 15, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                blurRadius: 10, spreadRadius: 1, color: Colors.grey.shade300),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.gambar,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.network(
                  widget.gambar,
                  width: 180,
                  height: 180 / 1.6,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.judul,
                maxLines: 2,
                style: TextStyle(
                  fontFamily: 'mbo',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dateformat.format(widget.tgl).split("%")[0],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        (widget.lihat > 1000)
                            ? widget.lihat.toString()[0] + "K "
                            : widget.lihat.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.visibility_rounded,
                        color: Colors.grey,
                        size: 10,
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

Widget kotload() {
  return Container(
    width: 180,
    height: 180,
    margin: EdgeInsets.only(right: 15, top: 10, bottom: 10),
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.2),
      borderRadius: BorderRadius.circular(20),
      // boxShadow: [
      //   BoxShadow(blurRadius: 10, spreadRadius: 1, color: Colors.grey.shade300),
      // ],
    ),
  );
}
