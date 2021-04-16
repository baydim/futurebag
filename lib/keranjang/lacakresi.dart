import 'package:flutter/material.dart';
import 'package:futurebag/controller/resicontroller.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

class LacakResi extends StatefulWidget {
  final String resi;
  final String via;
  LacakResi({this.resi, this.via});
  @override
  _LacakResiState createState() => _LacakResiState();
}

class _LacakResiState extends State<LacakResi> {
  String viaa;
  ResiController resiController = Get.put(ResiController());
  @override
  void initState() {
    if (widget.via == "J&T") {
      viaa = "jnt";
    } else {
      viaa = widget.via.toLowerCase();
    }
    resiController.getres(viaa, widget.resi);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        resiController.getlo();
        Get.back();
      },
      child: Scaffold(
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
                    "Pelacak resi",
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
                    Icons.local_shipping_rounded,
                  )),
                ),
              ],
            ),
            SliverToBoxAdapter(
                child: GetBuilder<ResiController>(
              init: ResiController(),
              builder: (val) {
                if (val.lo) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  // int has = val.modelRes.data.history.length;
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var a in val.modelRes.data.history)
                          TimelineTile(
                            beforeLineStyle: LineStyle(
                              color: Colors.grey.shade300,
                            ),
                            indicatorStyle: IndicatorStyle(
                              width: 20,
                              color: oren,
                            ),
                            endChild: Container(
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    a.date.toString(),
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  bawah(height: 10),
                                  Text(
                                    a.desc,
                                    style: TextStyle(
                                        fontSize: 13, fontFamily: 'mbo'),
                                  ),
                                  bawah(height: 10),
                                  Row(
                                    children: [
                                      Text("LOKASI : "),
                                      Text(a.location),
                                    ],
                                  ),
                                  Divider(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
