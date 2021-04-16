import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:futurebag/controller/getdatadiri.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class EditNama extends StatefulWidget {
  final String nama;
  EditNama({this.nama});
  @override
  _EditNamaState createState() => _EditNamaState();
}

class _EditNamaState extends State<EditNama> {
  GetDataDiri b = Get.put(GetDataDiri());
  TextEditingController a = TextEditingController();
  @override
  void initState() {
    a.text = widget.nama;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        padding: EdgeInsets.all(15),
        height: 130,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              controller: a,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  if (a.text.length == 0) {
                    // print('kk');
                  } else {
                    b.editna(a.text);
                    if (Get.isBottomSheetOpen) Get.back();
                  }
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: a.text.length == 0 ? Colors.grey : oren,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "Oke",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EditNomer extends StatefulWidget {
  final String no;
  EditNomer({this.no});
  @override
  _EditNomerState createState() => _EditNomerState();
}

class _EditNomerState extends State<EditNomer> {
  TextEditingController a = TextEditingController();
  @override
  void initState() {
    a.text = widget.no;
    super.initState();
  }

  GetDataDiri b = Get.put(GetDataDiri());
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        padding: EdgeInsets.all(15),
        height: 130,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              autofocus: true,
              controller: a,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  if (a.text.length == 0) {
                    // print('kk');
                  } else {
                    b.editno(a.text);
                    if (Get.isBottomSheetOpen) Get.back();
                  }
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: a.text.length == 0 ? Colors.grey : oren,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "Oke",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EditAlamat extends StatefulWidget {
  final String alamat;
  EditAlamat({this.alamat});
  @override
  _EditAlamatState createState() => _EditAlamatState();
}

class _EditAlamatState extends State<EditAlamat> {
  TextEditingController a = TextEditingController();
  GetDataDiri b = Get.put(GetDataDiri());
  @override
  void initState() {
    a.text = widget.alamat;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        padding: EdgeInsets.all(15),
        height: 130,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              controller: a,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  if (a.text.length == 0) {
                    // print('kk');
                  } else {
                    b.edital(a.text);
                    if (Get.isBottomSheetOpen) Get.back();
                  }
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: a.text.length == 0 ? Colors.grey : oren,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "Oke",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
