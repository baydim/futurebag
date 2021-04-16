import 'package:flutter/material.dart';
import 'package:futurebag/controller/barangcontroller.dart';
import 'package:futurebag/style/kotakbarang.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Shop extends StatefulWidget {
  final bool a;
  Shop({this.a});
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  TextEditingController t = TextEditingController();
  BarangController barangController = Get.put(BarangController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      onHorizontalDragDown: (details) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: GetBuilder<BarangController>(
        init: BarangController(),
        builder: (val) => Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                floating: true,
                elevation: 0,
                title: Container(
                  padding: EdgeInsets.only(left: 15, bottom: 0, right: 0),
                  height: 40,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: TextField(
                    autofocus: widget.a,
                    controller: t,
                    onChanged: (value) {
                      barangController.cari(value);
                      setState(() {});
                    },
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search_rounded,
                      ),
                      hintText: "Cari sesuatu",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: val.barang.isEmpty || val.barang == null
                      ? Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 60, right: 60),
                              child: Image.asset('assets/kos.png'),
                            ),
                            bawah(height: 30),
                            Text(
                              "Hyung barangnya tidak ada",
                              style: TextStyle(fontFamily: 'mbo', fontSize: 15),
                            ),
                          ],
                        )
                      : t.text.length == 0
                          ? ResponsiveGridRow(
                              children: [
                                for (var a in val.barang)
                                  ResponsiveGridCol(
                                    xs: 6,
                                    md: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 0, 8, 25),
                                      child: kotakbarang(
                                        a['id'],
                                        a['gambar'],
                                        a['nama'],
                                        a['harga'],
                                        a['hargacoret'],
                                        a['deskripsi'],
                                        a['kelas'],
                                        a['stock'],
                                        a['hot'],
                                      ),
                                    ),
                                  )
                              ],
                            )
                          : ResponsiveGridRow(
                              children: [
                                if (val.temu.isEmpty)
                                  ResponsiveGridCol(
                                    // md: 12,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 60, right: 60),
                                          child: Image.asset('assets/kos.png'),
                                        ),
                                        bawah(height: 30),
                                        Text(
                                          "Hyung barangnya tidak ada",
                                          style: TextStyle(
                                              fontFamily: 'mbo', fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  )
                                else
                                  for (var a in val.temu)
                                    ResponsiveGridCol(
                                      xs: 6,
                                      md: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 0, 8, 25),
                                        child: kotakbarang(
                                          a['id'],
                                          a['gambar'],
                                          a['nama'],
                                          a['harga'],
                                          a['hargacoret'],
                                          a['deskripsi'],
                                          a['kelas'],
                                          a['stock'],
                                          a['hot'],
                                        ),
                                      ),
                                    )
                              ],
                            ),
                ),
              ),
              SliverToBoxAdapter(
                child: bawah(
                  height: 50,
                ),
              ),
              // SliverToBoxAdapter(
              //   child: Column(
              //     children: [
              //       kotakbarang(
              //           "assets/d.jpeg",
              //           "EBook laravel pemula",
              //           "200.000",
              //           "Ebook laravel cocok untuk pemula hiya hiya iya dong bkvug kbkxcbbuis kbzkbig khbzuioh")
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
