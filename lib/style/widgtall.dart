import 'package:flutter/material.dart';
import 'package:get/get.dart';

BoxShadow boxShadow1 = BoxShadow(
  blurRadius: 10,
  color: Colors.grey.shade300,
);

Color oren = Colors.orange.shade400;
Color coblur = Colors.grey.shade200.withOpacity(0.2);
Widget bawah({double height}) {
  return SizedBox(
    height: height,
  );
}

Widget samping({double width}) {
  return SizedBox(
    width: width,
  );
}

Widget tombolauth(String nama) {
  return Container(
    width: Get.width / 2.3,
    height: 40,
    decoration: BoxDecoration(
        color: Colors.orange.shade400,
        borderRadius: BorderRadius.circular(45),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
          )
        ]),
    child: Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Center(
        child: Text(
          nama,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'mbo',
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

Widget tombolpan(String nama, Color col) {
  return Container(
    width: Get.width,
    height: 40,
    decoration: BoxDecoration(
        color: col,
        borderRadius: BorderRadius.circular(45),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
          )
        ]),
    child: Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Center(
        child: Text(
          nama,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'mbo',
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

Widget fombor(String nama, String hint, Function f, TextEditingController co,
    IconData ic, TextInputType tp) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text.rich(
        TextSpan(
          style: TextStyle(fontFamily: 'mbo'),
          children: [
            TextSpan(
              text: nama,
              style: TextStyle(),
            ),
            TextSpan(
              text: " *",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      TextField(
        maxLength: hint == "Punya WA kan" ? 13 : null,
        controller: co,
        onChanged: f,
        keyboardType: tp,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: Icon(
            ic,
          ),
        ),
      ),
    ],
  );
}

Widget upbot() {
  return Center(
    child: Container(
      height: 8,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  );
}
