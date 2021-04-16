import 'package:flutter/material.dart';
import 'package:futurebag/controller/bankcontroller.dart';
import 'package:futurebag/controller/belicontroller.dart';
import 'package:futurebag/controller/nohpcontroller.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Rules extends StatefulWidget {
  final String id;
  final String nambarang;
  final int jum;
  final String napem;
  final String alpem;
  final String empem;
  Rules(
      {this.id, this.nambarang, this.jum, this.napem, this.alpem, this.empem});
  @override
  _RulesState createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankController>(
      init: BankController(),
      builder: (val) => Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_rounded,
                      color: Colors.red,
                    ),
                    samping(width: 5),
                    Text(
                      "Puenting buanget nih",
                      style: TextStyle(
                        fontFamily: 'mbo',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                bawah(height: 10),
                Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  "Untuk melakukan pembayaran anda harus mentransfer ke rekening "),
                          TextSpan(
                            text: val.bank['bank'],
                            style: TextStyle(fontFamily: 'mbo'),
                          ),
                          TextSpan(
                              text: ",Kami melakukan checking selama 24 jam")
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    // Text(
                    //   "Untuk melakukan pembayaran anda harus mentransfer ke rekening BRI,Kami melakukan checking selama 24 jam.",
                    //   style: TextStyle(
                    //     fontSize: 13,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                    bawah(height: 15),
                    Text(
                      val.bank['no'],
                      style: TextStyle(fontSize: 13, fontFamily: 'mbo'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                bawah(height: 15),
                Divider(
                  color: Colors.black26,
                  height: 0,
                ),
                bawah(height: 15),
                Column(
                  children: [
                    Text(
                      "Jangan lupa ya tambahkan keterangan saat transfer dengan format seperti dibawah ini",
                      style: TextStyle(fontSize: 13, fontFamily: 'mbo'),
                      textAlign: TextAlign.center,
                    ),
                    bawah(height: 15),
                    Row(
                      children: [
                        Text(
                          "Id beli    : ",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          widget.id,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Nama barang    : ",
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //       ),
                    //     ),
                    //     Text(
                    //       widget.nambarang,
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Jumlah barang  : ",
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //       ),
                    //     ),
                    //     Text(
                    //       widget.jum.toString(),
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Nama pembeli  : ",
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //       ),
                    //     ),
                    //     Text(
                    //       widget.napem,
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Email pembeli : ",
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //       ),
                    //     ),
                    //     Text(
                    //       widget.empem,
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
            InkWell(
                onTap: () {
                  Beli.ambil(widget.id,
                      atasnama: widget.napem, alamat: widget.alpem);
                  Get.back();
                },
                child: tombolpan("Lanjutkan", oren))
          ],
        ),
      ),
    );
  }
}

class Rulesa extends StatefulWidget {
  final String id;
  final String nambarang;
  final int jum;
  final String napem;
  final String alpem;
  final String empem;
  Rulesa(
      {this.id, this.nambarang, this.jum, this.napem, this.alpem, this.empem});
  @override
  _RulesaState createState() => _RulesaState();
}

class _RulesaState extends State<Rulesa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Kirim bukti",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_rounded,
                      color: Colors.red,
                    ),
                    samping(width: 5),
                    Text(
                      "Puenting buanget nih",
                      style: TextStyle(
                        fontFamily: 'mbo',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                bawah(height: 10),
                GetBuilder<BankController>(
                  init: BankController(),
                  builder: (val) => Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontSize: 13,
                          ),
                          children: [
                            TextSpan(
                                text:
                                    "Untuk melakukan pembayaran anda harus mentransfer ke rekening "),
                            TextSpan(
                              text: val.bank['bank'],
                              style: TextStyle(fontFamily: 'mbo'),
                            ),
                            TextSpan(
                                text: ",Kami melakukan checking selama 24 jam")
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      bawah(height: 15),
                      Text(
                        val.bank['no'],
                        style: TextStyle(fontSize: 13, fontFamily: 'mbo'),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                bawah(height: 15),
                Divider(
                  color: Colors.black26,
                  height: 0,
                ),
                bawah(height: 15),
                Column(
                  children: [
                    Text(
                      "Jangan lupa ya tambahkan keterangan saat transfer dengan format seperti dibawah ini",
                      style: TextStyle(fontSize: 13, fontFamily: 'mbo'),
                      textAlign: TextAlign.center,
                    ),
                    bawah(height: 15),
                    Row(
                      children: [
                        Text(
                          "Id beli    : ",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          widget.id,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Nama barang    : ",
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //       ),
                    //     ),
                    //     Text(
                    //       widget.nambarang,
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Jumlah barang  : ",
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //       ),
                    //     ),
                    //     Text(
                    //       widget.jum.toString(),
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Nama pembeli  : ",
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //       ),
                    //     ),
                    //     Text(
                    //       widget.napem,
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Email pembeli : ",
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //       ),
                    //     ),
                    //     Text(
                    //       widget.empem,
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
            GetBuilder<NohpController>(
              init: NohpController(),
              builder: (val) {
                String n = val.nohp['no'].toString();
                return InkWell(
                    onTap: () {
                      _launch('whatsapp://send?phone=+62$n');
                      // Beli.ambil(widget.id,
                      //     atasnama: widget.napem, alamat: widget.alpem);
                      Get.back();
                    },
                    child: tombolpan("Lanjutkan", oren));
              },
            )
          ],
        ),
      ),
    );
  }
}

void _launch(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print("Not supported");
  }
}
