import 'package:flutter/material.dart';
import 'package:futurebag/controller/bankcontroller.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class InfoPembayaran extends StatefulWidget {
  @override
  _InfoPembayaranState createState() => _InfoPembayaranState();
}

class _InfoPembayaranState extends State<InfoPembayaran> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankController>(
        init: BankController(),
        builder: (val) => (Container(
              padding: EdgeInsets.all(15),
              height: Get.height - 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              child: Icon(
                                Icons.close_rounded,
                                size: 30,
                                color: oren,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Kebijakan pembayaran",
                          style: TextStyle(
                            fontFamily: 'mbo',
                            fontSize: 18,
                          ),
                        ),
                        bawah(height: 30),
                        Image.asset(
                          "assets/infop.png",
                          width: Get.width / 1.9,
                          fit: BoxFit.contain,
                        ),
                        bawah(height: 15),
                        // Text(
                        //   "Untuk melakukan pembayaran anda harus mentransfer ke rekening BRI,Kami melakukan checking selama 24 jam.Jika ada kendala atau keluhan kamu bisa menghubungi nomer yang ada dibawah sendiri",
                        //   style: TextStyle(letterSpacing: 0.3, wordSpacing: 0.3),
                        //   textAlign: TextAlign.center,
                        // ),
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
                                      text:
                                          ",Kami melakukan checking selama 24 jam")
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
                            // bawah(height: 15),
                            // Text(
                            //   val.bank['no'],
                            //   style: TextStyle(fontSize: 13, fontFamily: 'mbo'),
                            //   textAlign: TextAlign.center,
                            // ),
                            bawah(height: 30),
                            Column(
                              children: [
                                Text(
                                  "Nomer Rekening",
                                  style: TextStyle(
                                    fontFamily: 'mbo',
                                    fontSize: 16,
                                  ),
                                ),
                                bawah(height: 5),
                                Text(
                                  val.bank['no'],
                                  style: TextStyle(
                                      fontSize: 13, fontFamily: 'mbo'),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
            )));
  }
}
