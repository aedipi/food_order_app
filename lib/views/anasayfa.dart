import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/colors.dart';
import 'package:food_order_app/cubit/anasayfa_cubit.dart';
import 'package:food_order_app/entity/kullanicilar.dart';
import 'package:food_order_app/entity/yemekler.dart';
import 'package:food_order_app/views/yemek_detay_sayfa.dart';
import 'package:google_fonts/google_fonts.dart';

class Anasayfa extends StatefulWidget {
  Kullanicilar kullanici;


  Anasayfa({required this.kullanici});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().yemekleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: turuncu,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,)),
        title: aramaYapiliyorMu ?
        TextField(
          onChanged: (aramaSonucu) {
            // context.read<AnasayfaCubit>().ara(aramaSonucu);
          },
          decoration: InputDecoration(hintText: ("Ara"),hintStyle: GoogleFonts.quicksand(color: Colors.white)),
        )
            : Text("Yemekler",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600)),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: () {
            setState(() {
              aramaYapiliyorMu = false;
            });
          }, icon: Icon(Icons.clear)) :
          IconButton(onPressed: () {
            setState(() {
              aramaYapiliyorMu = true;
            });
          }, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: BlocBuilder<AnasayfaCubit, List<Yemekler>>(
        builder: (context, yemeklerListesi) {
          if (yemeklerListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: yemeklerListesi.length,
              itemBuilder: (context, indeks) {
                var yemek = yemeklerListesi[indeks];
                return Align(
                  heightFactor: 0.75,
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              YemekDetaySayfa(yemek: yemek,kullanici: widget.kullanici,)))
                          .then((value) {
                        context.read<AnasayfaCubit>().yemekleriYukle();
                      });
                    },
                    child: Container(
                        height:indeks == yemeklerListesi.length-1 ? 250: 150,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20.0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black.withAlpha(100),
                                  blurRadius: 10.0),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "${yemek.yemek_adi}",
                                    style: GoogleFonts.quicksand(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${yemek.yemek_adi}",
                                    style: GoogleFonts.quicksand(color: Colors.grey,fontSize: 17),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${yemek.yemek_fiyat} ₺",
                                    style: GoogleFonts.quicksand(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 130,
                                child: Image.network(
                                    "http://kasimadalan.pe.hu/yemekler/resimler/${yemek
                                        .yemek_resim_adi}"),
                              ),
                            ],
                          ),
                        )),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}