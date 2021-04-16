import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:futurebag/controller/detailcontroller.dart';
import 'package:futurebag/style/curency.dart';
import 'package:futurebag/style/dateformat.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
// import 'package:whatsapp_share/whatsapp_share.dart';

class Kap extends StatefulWidget {
  final String id;
  Kap({this.id});
  // Kap({Key key, this.title}) : super(key: key);

  // final String title;

  @override
  _KapState createState() => _KapState();
}

class _KapState extends State<Kap> {
  File _imageFile;

  ScreenshotController screenshotController = ScreenshotController();

  _takeScreenshot(String pesan) async {
    _imageFile = null;
    screenshotController
        .capture(delay: Duration(milliseconds: 100), pixelRatio: 2)
        .then((File image) async {
      setState(() {
        _imageFile = image;
      });
      final directory = (await getApplicationDocumentsDirectory()).path;
      Uint8List pngBytes = _imageFile.readAsBytesSync();
      final h = DateTime.now();
      File imgFile = File('$directory/$h.png');
      imgFile.writeAsBytes(pngBytes);
      print("File Save");
      await Share.shareFiles(['$directory/$h.png'], text: pesan);
      // await WhatsappShare.share(phone: "+6285735379740", text: pesan);
      // await WhatsappShare.shareFile(
      //     text: 'Whatsapp share text',
      //     phone: '+6285735379740',
      //     filePath: [imgFile.path]);
    }).catchError((e) {
      print(e.toString());
    });
  }

  DetailController detailController = Get.put(DetailController());
  String nama;
  String id;
  @override
  void initState() {
    super.initState();

    detailController.getdetailj(id: widget.id);
  }

  @override
  void dispose() {
    detailController.getdetailj(id: widget.id);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        init: DetailController(),
        builder: (val) {
          // String w = f.format(waktu.toDate());
          for (var a in val.detil) {
            nama = a['data']['nama'];
            id = a['id'];
          }
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
                        "Bukti pembelian",
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
                        Icons.shopping_bag_rounded,
                      )),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                    child: Column(
                  children: [
                    for (var a in val.detil)
                      Screenshot(
                        controller: screenshotController,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(color: Colors.grey)],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 30,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: QrImage(
                                  padding: EdgeInsets.all(0),
                                  data: a['id'],
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: oren.withOpacity(0.1),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/gandini.png',
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.contain,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "BUKTI PEMBELIAN BARANG",
                                            style: TextStyle(
                                                fontFamily: 'mbo',
                                                fontSize: 16),
                                          ),
                                          bawah(height: 2),
                                          Text(
                                            "DARI GANDINI STORE",
                                            style: TextStyle(
                                                fontFamily: 'mbo',
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        'assets/gandini.png',
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.contain,
                                      ),
                                    ],
                                  ),

                                  bawah(height: 10),
                                  Divider(
                                    color: Colors.black54,
                                    height: 0,
                                  ),
                                  bawah(height: 10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                            width: 85,
                                            height: 85,
                                            child: Image.network(
                                              a['data']['gambar'],
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      samping(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Nama barang : "),
                                              Text(
                                                a['data']['nambar'],
                                                style: TextStyle(
                                                    fontFamily: 'mbo'),
                                              ),
                                            ],
                                          ),
                                          bawah(height: 5),
                                          Row(
                                            children: [
                                              Text("Jumlah beli : "),
                                              Text(
                                                a['data']['jumpes'].toString(),
                                                style: TextStyle(
                                                    fontFamily: 'mbo'),
                                              ),
                                            ],
                                          ),
                                          bawah(height: 5),
                                          Row(
                                            children: [
                                              Text("Jumlah harga : "),
                                              Text(
                                                curency
                                                    .format(a['data']['harga']),
                                                style: TextStyle(
                                                    fontFamily: 'mbo'),
                                              ),
                                            ],
                                          ),
                                          bawah(height: 5),
                                          Row(
                                            children: [
                                              Text("Status barang : "),
                                              Text(
                                                (a['data']['status']),
                                                style: TextStyle(
                                                    fontFamily: 'mbo'),
                                              ),
                                            ],
                                          ),
                                          bawah(height: 5),
                                          Row(
                                            children: [
                                              Text("ID barang : "),
                                              Text(
                                                (a['data']['idbarang']),
                                                style: TextStyle(
                                                    fontFamily: 'mbo'),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),

                                  bawah(height: 10),
                                  Text.rich(
                                    TextSpan(
                                      style: TextStyle(
                                        letterSpacing: 0.3,
                                        height: 1.2,
                                      ),
                                      children: [
                                        TextSpan(text: "Bahwa saudara "),
                                        TextSpan(
                                          text: a['data']['nama'],
                                          style: TextStyle(fontFamily: 'mbo'),
                                        ),
                                        TextSpan(
                                            text:
                                                " telah membeli barang dari kami sesuai diatas dengan email "),
                                        TextSpan(
                                          text: a['data']['email'],
                                          style: TextStyle(fontFamily: 'mbo'),
                                        ),
                                        TextSpan(text: " pada tanggal "),
                                        TextSpan(
                                          text: dateformat
                                              .format(a['data']['wak'].toDate())
                                              .toString()
                                              .split('%')[0],
                                          style: TextStyle(fontFamily: 'mbo'),
                                        ),
                                        TextSpan(text: " pada pukul "),
                                        TextSpan(
                                          text: dateformat
                                              .format(a['data']['wak'].toDate())
                                              .toString()
                                              .split('%')[1],
                                          style: TextStyle(fontFamily: 'mbo'),
                                        ),
                                        TextSpan(
                                            text:
                                                ", barang tersebut beratas namakan "),
                                        TextSpan(
                                          text: a['data']['atasnama'],
                                          style: TextStyle(fontFamily: 'mbo'),
                                        ),
                                        TextSpan(text: " dengan alamat "),
                                        TextSpan(
                                          text: a['data']['alamat'],
                                          style: TextStyle(fontFamily: 'mbo'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  bawah(height: 10),
                                  Divider(
                                    color: Colors.black54,
                                    height: 0,
                                  ),
                                  bawah(height: 10),
                                  Text(
                                    "Berikan bukti ini untuk mengajukan laporan atau kendala dalam pengiriman atau kerusakan kondisi barang saat sampai pada alamat tertera, dengan cetak bukti yang dikirimkan ke nomer gandini store, dengan itu kami akan membantu anda menangani masalah tersebut untuk ditindak lanjuti.",
                                    style: TextStyle(
                                      letterSpacing: 0.3,
                                      height: 1.2,
                                    ),
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        for (var i = 0; i < 4; i++)
                                          RotatedBox(
                                            quarterTurns: i,
                                            child: SizedBox(
                                              width: 70,
                                              height: 70,
                                              child: QrImage(
                                                data: a['id'],
                                              ),
                                            ),
                                          ),
                                        // Text(a['id'])
                                      ],
                                    ),
                                  ),

                                  Center(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          for (var i = 0;
                                              i < Get.width / 23;
                                              i++)
                                            Image.asset(
                                              'assets/gandinit.png',
                                              width: 20,
                                              height: 20,
                                              fit: BoxFit.contain,
                                            ),
                                        ],
                                      ),
                                    ),
                                  )
                                  // Text(
                                  //   a.toString(),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                )),
              ],
            ),
            bottomNavigationBar: InkWell(
              onTap: () {
                _takeScreenshot(
                    "Ini adalah bukti dari $nama dengan ID pembelian $id");
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: tombolpan("Kirim bukti", oren),
              ),
            ),
          );
        });
  }
}
