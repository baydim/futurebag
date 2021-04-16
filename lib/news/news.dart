import 'package:flutter/material.dart';
import 'package:futurebag/controller/newscontroller.dart';
import 'package:futurebag/news/widgetkotak.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  NewsController n = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            floating: true,
            elevation: 1,
            title: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Gandini",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " News",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: GetBuilder<NewsController>(
              init: NewsController(),
              builder: (val) => Column(
                children: [
                  bawah(
                    height: 7.5,
                  ),
                  for (var a in val.news)
                    Widgetkotak(
                      id: a['id'],
                      judul: a['data']['judul'],
                      gambar: a['data']['gambar'],
                      isi: a['data']['isi'],
                      tgl: a['data']['tgl'].toDate(),
                      lihat: a['data']['lihat'],
                    ),
                  bawah(
                    height: 60,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
