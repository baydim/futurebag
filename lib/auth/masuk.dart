import 'package:flutter/material.dart';
import 'package:futurebag/controller/authcontroller.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class Masuk extends StatefulWidget {
  @override
  _MasukState createState() => _MasukState();
}

class _MasukState extends State<Masuk> {
  bool ob = true;
  var height = Get.height / 2.3;
  TextEditingController em = TextEditingController();
  TextEditingController pw = TextEditingController();
  Acontroller acontroller = Get.put(Acontroller());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // TextField(
          //   onChanged: (value) {
          //     setState(() {
          //       print(value);
          //     });
          //   },
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'mbo',
                    fontSize: 25,
                  ),
                  children: [
                    TextSpan(
                      text: "Pernah kesini ya?",
                      style: TextStyle(),
                    ),
                    ob
                        ? TextSpan(
                            text: "🙈",
                          )
                        : TextSpan(
                            text: "🙊",
                          ),
                  ],
                ),
              ),
              Text(
                "Masih inget yang dulu kan...",
                style: TextStyle(),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      style: TextStyle(fontFamily: 'mbo'),
                      children: [
                        TextSpan(
                          text: "Email",
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
                    controller: em,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: "Ex:Email@gmail.com",
                      suffixIcon: Icon(
                        Icons.account_circle_rounded,
                      ),
                    ),
                  ),
                ],
              ),
              bawah(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      style: TextStyle(fontFamily: 'mbo'),
                      children: [
                        TextSpan(
                          text: "Password",
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
                    controller: pw,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: "Eittt...rahasia lo ya",
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            ob ? ob = false : ob = true;
                          });
                        },
                        child: ob
                            ? Icon(Icons.visibility_rounded)
                            : Icon(Icons.visibility_off_rounded),
                      ),
                    ),
                    obscureText: ob,
                  ),
                ],
              ),
            ],
          ),
          em.text.length == 0 || pw.text.length == 0
              ? Container(
                  width: Get.width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey,
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
                        "Lanjut",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'mbo',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    acontroller.masuk(email: em.text, pass: pw.text);
                    // if (Get.isBottomSheetOpen) Get.back();
                    // Future.delayed(Duration(milliseconds: 500), () {
                    //   Get.to(
                    //     Kenal(),
                    //     transition: Transition.downToUp,
                    //   );
                    // });
                  },
                  child: Container(
                    width: Get.width,
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
                          "Lanjut",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'mbo',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),

      // GestureDetector(
      //   onVerticalDragStart: (details) {
      //     setState(() {
      //       h ? h = false : h = true;
      //     });
      //   },
      //   child:
      //   AnimatedContainer(
      //     height: h ? height : Get.height,
      //     duration: Duration(
      //       milliseconds: 100,
      //     ),
      //     padding: EdgeInsets.all(15),
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.circular(20),
      //     ),
      //     child: Column(
      //       children: [
      //         Container(),
      //       ],
      //     ),
      //   ),
    );
  }
}
