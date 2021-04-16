import 'package:flutter/material.dart';
import 'package:futurebag/controller/authcontroller.dart';
import 'package:futurebag/controller/getdatadiri.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:futurebag/user/edituser.dart';
import 'package:get/get.dart';

class Userr extends StatefulWidget {
  @override
  _UserrState createState() => _UserrState();
}

class _UserrState extends State<Userr> {
  Acontroller acontroller = Get.put(Acontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Center(
            child: Text(
              "Profilku",
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
                Icons.account_circle_rounded,
                color: oren,
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder<GetDataDiri>(
        init: GetDataDiri(),
        builder: (val) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      EditNama(
                        nama: val.datadiri['nama'].toString(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: oren,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                val.datadiri['nama'][0],
                                style: TextStyle(
                                  fontFamily: 'mbo',
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          samping(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                val.datadiri['nama'],
                                style: TextStyle(
                                  fontFamily: 'mbo',
                                  fontSize: 18,
                                ),
                              ),
                              bawah(height: 5),
                              Text(
                                val.datadiri['email'],
                                style: TextStyle(
                                    // fontFamily: 'mbo',
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Icon(Icons.edit),
                    ],
                  ),
                ),
                bawah(height: 30),
                InkWell(
                  onTap: () {
                    Get.bottomSheet(
                        EditNomer(no: val.datadiri['nomor_tlp'].toString()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: oren,
                      ),
                      samping(width: 15),
                      Text(
                        val.datadiri['nomor_tlp'].toString(),
                        style: TextStyle(fontFamily: 'mbo'),
                      )
                    ],
                  ),
                ),
                bawah(height: 20),
                InkWell(
                  onTap: () {
                    Get.bottomSheet(EditAlamat(
                      alamat: val.datadiri['alamat'],
                    ));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.pin_drop_rounded,
                        color: oren,
                      ),
                      samping(width: 15),
                      Text(
                        val.datadiri['alamat'],
                        style: TextStyle(fontFamily: 'mbo'),
                      )
                    ],
                  ),
                ),
                bawah(height: 20),
                Divider(
                  thickness: 1,
                ),
                bawah(height: 20),
                Row(
                  children: [
                    Icon(
                      Icons.security_rounded,
                      color: oren,
                    ),
                    samping(width: 15),
                    Text(
                      "Kebijakan privasi",
                      style: TextStyle(fontFamily: 'mbo'),
                    )
                  ],
                ),
                bawah(height: 20),
                Row(
                  children: [
                    Icon(
                      Icons.volunteer_activism,
                      color: oren,
                    ),
                    samping(width: 15),
                    Text(
                      "Ketentuan layanan",
                      style: TextStyle(fontFamily: 'mbo'),
                    )
                  ],
                ),
                bawah(height: 20),
                InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    acontroller.out();
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: oren,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                      samping(width: 15),
                      Text(
                        "Keluar dari aplikasi",
                        style: TextStyle(fontFamily: 'mbo'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
