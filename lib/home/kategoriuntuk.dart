import 'package:flutter/material.dart';
import 'package:futurebag/controller/barangcontroller.dart';
import 'package:futurebag/style/kelas.dart';
import 'package:futurebag/style/kotakpanjang.dart';
import 'package:futurebag/style/widgtall.dart';
import 'package:get/get.dart';

class KategoriUntuk extends StatefulWidget {
  @override
  _KategoriUntukState createState() => _KategoriUntukState();
}

class _KategoriUntukState extends State<KategoriUntuk> {
  String pil = kategori[0];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Kategori Untukmu",
                style: TextStyle(
                  fontFamily: 'mbo',
                  fontSize: 18,
                ),
              ),
            ),
            bawah(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  samping(
                    width: 15,
                  ),
                  for (var a in kategori)
                    Row(
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              pil = a;
                            });
                          },
                          child: Container(
                            height: 30,
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 2),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: a == pil ? oren : Colors.transparent,
                              border: Border.all(
                                color: a == pil ? oren : Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                a,
                                style: TextStyle(
                                  color: a == pil ? Colors.white : Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
        bawah(
          height: 10,
        ),
        GetBuilder<BarangController>(
          init: BarangController(),
          builder: (val) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                val.hotrpl.isEmpty || val.hotrpl == null
                    ? samping(
                        width: 0,
                      )
                    : samping(
                        width: 15,
                      ),
                if (pil == kategori[0])
                  if (val.hotrpl.isEmpty || val.hotrpl == null)
                    if (val.rpl.isEmpty || val.rpl == null)
                      kso()
                    else
                      for (var a in val.rpl)
                        kotakpanjang(
                          id: a['id'],
                          gambar: a['gambar'],
                          nama: a['nama'],
                          harga: a['harga'],
                          hargaco: a['hargacoret'],
                          desk: a['deskripsi'],
                          kelas: a['kelas'],
                          stock: a['stock'],
                          hot: a['hot'],
                        )
                  else
                    for (var a in val.hotrpl)
                      kotakpanjang(
                        id: a['id'],
                        gambar: a['gambar'],
                        nama: a['nama'],
                        harga: a['harga'],
                        hargaco: a['hargacoret'],
                        desk: a['deskripsi'],
                        kelas: a['kelas'],
                        stock: a['stock'],
                        hot: a['hot'],
                      ),
                if (pil == kategori[1])
                  if (val.hotpemesinan.isEmpty || val.hotpemesinan == null)
                    if (val.tpemesinan.isEmpty || val.tpemesinan == null)
                      kso()
                    else
                      for (var a in val.tpemesinan)
                        kotakpanjang(
                          id: a['id'],
                          gambar: a['gambar'],
                          nama: a['nama'],
                          harga: a['harga'],
                          hargaco: a['hargacoret'],
                          desk: a['deskripsi'],
                          kelas: a['kelas'],
                          stock: a['stock'],
                          hot: a['hot'],
                        )
                  else
                    for (var a in val.hotpemesinan)
                      kotakpanjang(
                        id: a['id'],
                        gambar: a['gambar'],
                        nama: a['nama'],
                        harga: a['harga'],
                        hargaco: a['hargacoret'],
                        desk: a['deskripsi'],
                        kelas: a['kelas'],
                        stock: a['stock'],
                        hot: a['hot'],
                      ),
                if (pil == kategori[2])
                  if (val.hotpengelasan.isEmpty || val.hotpengelasan == null)
                    if (val.tpengelasan.isEmpty || val.tpengelasan == null)
                      kso()
                    else
                      for (var a in val.tpengelasan)
                        kotakpanjang(
                          id: a['id'],
                          gambar: a['gambar'],
                          nama: a['nama'],
                          harga: a['harga'],
                          hargaco: a['hargacoret'],
                          desk: a['deskripsi'],
                          kelas: a['kelas'],
                          stock: a['stock'],
                          hot: a['hot'],
                        )
                  else
                    for (var a in val.hotpengelasan)
                      kotakpanjang(
                        id: a['id'],
                        gambar: a['gambar'],
                        nama: a['nama'],
                        harga: a['harga'],
                        hargaco: a['hargacoret'],
                        desk: a['deskripsi'],
                        kelas: a['kelas'],
                        stock: a['stock'],
                        hot: a['hot'],
                      ),
                if (pil == kategori[3])
                  if (val.hotdpib.isEmpty || val.hotdpib == null)
                    if (val.dpib.isEmpty || val.dpib == null)
                      kso()
                    else
                      for (var a in val.dpib)
                        kotakpanjang(
                          id: a['id'],
                          gambar: a['gambar'],
                          nama: a['nama'],
                          harga: a['harga'],
                          hargaco: a['hargacoret'],
                          desk: a['deskripsi'],
                          kelas: a['kelas'],
                          stock: a['stock'],
                          hot: a['hot'],
                        )
                  else
                    for (var a in val.hotdpib)
                      kotakpanjang(
                        id: a['id'],
                        gambar: a['gambar'],
                        nama: a['nama'],
                        harga: a['harga'],
                        hargaco: a['hargacoret'],
                        desk: a['deskripsi'],
                        kelas: a['kelas'],
                        stock: a['stock'],
                        hot: a['hot'],
                      ),
                if (pil == kategori[4])
                  if (val.hotbsm.isEmpty || val.hotbsm == null)
                    if (val.tbsm.isEmpty || val.tbsm == null)
                      kso()
                    else
                      for (var a in val.tbsm)
                        kotakpanjang(
                          id: a['id'],
                          gambar: a['gambar'],
                          nama: a['nama'],
                          harga: a['harga'],
                          hargaco: a['hargacoret'],
                          desk: a['deskripsi'],
                          kelas: a['kelas'],
                          stock: a['stock'],
                          hot: a['hot'],
                        )
                  else
                    for (var a in val.hotbsm)
                      kotakpanjang(
                        id: a['id'],
                        gambar: a['gambar'],
                        nama: a['nama'],
                        harga: a['harga'],
                        hargaco: a['hargacoret'],
                        desk: a['deskripsi'],
                        kelas: a['kelas'],
                        stock: a['stock'],
                        hot: a['hot'],
                      ),
                if (pil == kategori[5])
                  if (val.hotei.isEmpty || val.hotei == null)
                    if (val.ei.isEmpty || val.ei == null)
                      kso()
                    else
                      for (var a in val.ei)
                        kotakpanjang(
                          id: a['id'],
                          gambar: a['gambar'],
                          nama: a['nama'],
                          harga: a['harga'],
                          hargaco: a['hargacoret'],
                          desk: a['deskripsi'],
                          kelas: a['kelas'],
                          stock: a['stock'],
                          hot: a['hot'],
                        )
                  else
                    for (var a in val.hotei)
                      kotakpanjang(
                        id: a['id'],
                        gambar: a['gambar'],
                        nama: a['nama'],
                        harga: a['harga'],
                        hargaco: a['hargacoret'],
                        desk: a['deskripsi'],
                        kelas: a['kelas'],
                        stock: a['stock'],
                        hot: a['hot'],
                      ),
                if (pil == kategori[6])
                  if (val.hotoi.isEmpty || val.hotoi == null)
                    if (val.oi.isEmpty || val.oi == null)
                      kso()
                    else
                      for (var a in val.oi)
                        kotakpanjang(
                          id: a['id'],
                          gambar: a['gambar'],
                          nama: a['nama'],
                          harga: a['harga'],
                          hargaco: a['hargacoret'],
                          desk: a['deskripsi'],
                          kelas: a['kelas'],
                          stock: a['stock'],
                          hot: a['hot'],
                        )
                  else
                    for (var a in val.hotoi)
                      kotakpanjang(
                        id: a['id'],
                        gambar: a['gambar'],
                        nama: a['nama'],
                        harga: a['harga'],
                        hargaco: a['hargacoret'],
                        desk: a['deskripsi'],
                        kelas: a['kelas'],
                        stock: a['stock'],
                        hot: a['hot'],
                      ),
                if (pil == kategori[7])
                  if (val.hotptu.isEmpty || val.hotptu == null)
                    if (val.tptu.isEmpty || val.tptu == null)
                      kso()
                    else
                      for (var a in val.tptu)
                        kotakpanjang(
                          id: a['id'],
                          gambar: a['gambar'],
                          nama: a['nama'],
                          harga: a['harga'],
                          hargaco: a['hargacoret'],
                          desk: a['deskripsi'],
                          kelas: a['kelas'],
                          stock: a['stock'],
                          hot: a['hot'],
                        )
                  else
                    for (var a in val.hotptu)
                      kotakpanjang(
                        id: a['id'],
                        gambar: a['gambar'],
                        nama: a['nama'],
                        harga: a['harga'],
                        hargaco: a['hargacoret'],
                        desk: a['deskripsi'],
                        kelas: a['kelas'],
                        stock: a['stock'],
                        hot: a['hot'],
                      )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
