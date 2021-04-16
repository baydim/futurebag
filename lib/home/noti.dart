import 'package:flutter/material.dart';
import 'package:futurebag/controller/keranjangcontroller.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class Noti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<KeranjangController>(
      init: KeranjangController(),
      builder: (val) => Container(
        width: 40,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.only(right: 0),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Icon(
                Icons.shopping_cart_rounded,
                color: oren,
              ),
            ),
            val.jumker != 0
                ? Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        val.jumker > 20 ? "20+" : val.jumker.toString(),

                        // "jum".toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    width: 0,
                    height: 0,
                  )
          ],
        ),
      ),
    );
  }
}
