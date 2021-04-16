import 'package:flutter/material.dart';
import 'package:futurebag/controller/newscontroller.dart';
import 'package:futurebag/news/widgetkotak.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class NewsUntuk extends StatefulWidget {
  @override
  _NewsUntukState createState() => _NewsUntukState();
}

class _NewsUntukState extends State<NewsUntuk> {
  Widget wid(Map li) {
    // return Column(
    //   children: [
    //     Text(li.toString()),
    //     Text(dateformat.format(li['data']['tgl'].toDate())),
    //   ],
    // );
    return WidgetKotakecil(
      id: li['id'],
      gambar: li['data']['gambar'],
      judul: li['data']['judul'],
      isi: li['data']['isi'],
      tgl: li['data']['tgl'].toDate(),
      lihat: li['data']['lihat'],
    );
    // Widgetkotak(
    //   id: li['id'],
    //   gambar: li['data']['gambar'],
    //   judul: li['data']['judul'],
    //   isi: li['data']['isi'],
    //   tgl: li['data']['tgl'].toDate(),
    //   lihat: li['data']['lihat'],
    // );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      init: NewsController(),
      builder: (val) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Berita untukmu",
                style: TextStyle(
                  fontFamily: 'mbo',
                  fontSize: 18,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  samping(width: 15),
                  if (val.news.isEmpty)
                    for (var i = 0; i < 5; i++) kotload()
                  else
                    for (var i = 0; i < 2; i++)
                      Column(
                        children: [wid(val.news[i])],
                      )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
