import 'package:flutter/material.dart';
import 'package:futurebag/controller/newscontroller.dart';
import 'package:futurebag/style/dateformat.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class DetilNews extends StatefulWidget {
  @override
  _DetilNewsState createState() => _DetilNewsState();
}

class _DetilNewsState extends State<DetilNews> {
  NewsController n = Get.put(NewsController());
  @override
  void initState() {
    n.newpu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<NewsController>(
        init: NewsController(),
        builder: (val) {
          return CustomScrollView(
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
                      "Gandini news",
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
                      Icons.layers_rounded,
                    )),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: val.detine.isEmpty || val.detine == null
                    ? SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              val.detine['data']['judul'],
                              style: TextStyle(
                                height: 1.2,
                                fontFamily: 'mbo',
                                fontSize: 18,
                              ),
                              textHeightBehavior: TextHeightBehavior(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(ImageZo(
                                      image: val.detine['data']['gambar'],
                                    ));
                                  },
                                  child: SizedBox(
                                    width: Get.width,
                                    height: Get.width / 2.5,
                                    child: Hero(
                                      tag: val.detine['data']['gambar'],
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            val.detine['data']['gambar'],
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ),
                                bawah(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      dateformat
                                          .format(
                                            val.detine['data']['tgl'].toDate(),
                                          )
                                          .split("%")[1],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    samping(width: 5),
                                    Text(
                                      dateformat
                                          .format(
                                            val.detine['data']['tgl'].toDate(),
                                          )
                                          .split("%")[0],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          // Text(val.detine['id']),
                          // Text(val.detine['data']['gambar']),
                          // Text(val.detine['data']['lihat'].toString()),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              val.detine['data']['isi'],
                              style: TextStyle(
                                height: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
              )
            ],
          );
        },
      ),
    );
  }
}

class ImageZo extends StatelessWidget {
  final String image;
  ImageZo({this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.white,
      child: Hero(
        tag: image,
        child: Image.network(image),
      ),
    );
  }
}
