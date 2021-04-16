import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:futurebag/controller/banercontroller.dart';
import 'package:futurebag/controller/bankcontroller.dart';
import 'package:futurebag/controller/barangcontroller.dart';
import 'package:futurebag/controller/getdatadiri.dart';
import 'package:futurebag/controller/keranjangcontroller.dart';
import 'package:futurebag/controller/newscontroller.dart';
import 'package:futurebag/controller/nohpcontroller.dart';
import 'package:futurebag/controller/resicontroller.dart';
import 'package:futurebag/home/home.dart';
import 'package:futurebag/news/news.dart';
import 'package:futurebag/shop/shop.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:futurebag/user/user.dart';
import 'package:get/get.dart';

class ButtonBo extends StatefulWidget {
  @override
  _ButtonBoState createState() => _ButtonBoState();
}

class _ButtonBoState extends State<ButtonBo> {
  final ser = FirebaseAuth.instance.currentUser;
  int hal = 0;
  PageController ct = PageController(keepPage: true);
  GetDataDiri getDataDiri = Get.put(GetDataDiri());
  BarangController barangController = Get.put(BarangController());
  KeranjangController keranjangController = Get.put(KeranjangController());
  ResiController resiController = Get.put(ResiController());
  NewsController ne = Get.put(NewsController());
  BanerController bn = Get.put(BanerController());
  BankController ban = Get.put(BankController());
  NohpController no = Get.put(NohpController());
  @override
  void initState() {
    super.initState();
    getDataDiri.getaku(ser.email);
    barangController.getbarang();
    keranjangController.getkeranjang(ser.email);
    resiController.getkeyres();
    ne.getnews();
    bn.getbaner();
    ban.getbank();
    no.getnohp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: PageView(
        controller: ct,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            // print(value);
            hal = value;
          });
        },
        children: [
          Home(),
          Shop(
            a: false,
          ),
          News(),
          Userr(),
        ],
      ),
      bottomNavigationBar: FluidNavBar(
        defaultIndex: hal,
        onChange: (selectedIndex) {
          // print(selectedIndex);
          setState(() {
            hal = selectedIndex;
            ct.animateToPage(selectedIndex,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          });
        },
        icons: [
          FluidNavBarIcon(icon: Icons.home_filled),
          FluidNavBarIcon(icon: Icons.shopping_bag_rounded),
          FluidNavBarIcon(icon: Icons.layers_rounded),
          FluidNavBarIcon(icon: Icons.account_circle_rounded),
        ],
        style: FluidNavBarStyle(
          barBackgroundColor: oren,
          iconBackgroundColor: oren,
          iconSelectedForegroundColor: Colors.white,
          iconUnselectedForegroundColor: Colors.black45,
        ),
        animationFactor: 0.6,
      ),
    );
  }
}
