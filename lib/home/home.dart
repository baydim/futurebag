import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:futurebag/controller/banercontroller.dart';
import 'package:futurebag/home/kategoriuntuk.dart';
import 'package:futurebag/home/newsuntuk.dart';
import 'package:futurebag/home/noti.dart';
import 'package:futurebag/keranjang/keranj.dart';
import 'package:futurebag/shop/shop.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [
    "assets/x.png",
    "assets/z.png",
    "assets/c.png",
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              title: InkWell(
                onTap: () {
                  Get.to(Shop(
                    a: true,
                  ));
                },
                child: Container(
                  padding: EdgeInsets.only(left: 15, top: 3, right: 15),
                  height: 40,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cari sesuatu",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              actions: [
                InkWell(
                    onTap: () {
                      Get.to(Keranj());
                      // Get.bottomSheet(
                      //   Keranj(),
                      //   isScrollControlled: true,
                      //   ignoreSafeArea: true,
                      // );
                      // Get.to(Keranj());
                      // print("object");
                    },
                    child: Noti())
              ],
            ),
            bawah(height: 5),
            GetBuilder<BanerController>(
              init: BanerController(),
              builder: (val) {
                if (val.baner.isBlank) {
                  return Container(
                    width: Get.width,
                    height: Get.width / 2.5,
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                  );
                } else {
                  return CarouselSlider.builder(
                    itemCount: val.baner.length,
                    options: CarouselOptions(
                      height: Get.width / 2.5,
                      autoPlay: true,
                      aspectRatio: 2.0,
                      viewportFraction: 0.92,
                      enlargeCenterPage: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 400),
                    ),
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            val.baner[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }

              },
            ),

            bawah(height: 20),
            KategoriUntuk(),
            bawah(height: 15),
            NewsUntuk(),
            bawah(height: 90),
          ],
        ),
      ),
    );
  }
}
