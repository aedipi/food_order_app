import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/colors.dart';
import 'package:food_order_app/cubit/yemek_detay_cubit.dart';
import 'package:food_order_app/entity/yemekler.dart';
import 'package:google_fonts/google_fonts.dart';

import '../entity/kullanicilar.dart';

class YemekDetaySayfa extends StatefulWidget {
  Yemekler yemek;
  Kullanicilar kullanici;
  YemekDetaySayfa({required this.yemek, required this.kullanici});

  @override
  State<YemekDetaySayfa> createState() => _YemekDetaySayfaState();
}

class _YemekDetaySayfaState extends State<YemekDetaySayfa> {
  int siparisAdet = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:turuncu,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text("Yemek Detay",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),

      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(13)),
                color: turuncu,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: acikTuruncu,// Shadow position
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.35,
              alignment: Alignment.center,
              child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}"),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(13)),
                color: turuncu,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: acikTuruncu,// Shadow position
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width*0.6,
              height: MediaQuery.of(context).size.height*0.1,
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text("${widget.yemek.yemek_adi}",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(13)),
                color: turuncu,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: acikTuruncu,// Shadow position
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width*0.4,
              height: MediaQuery.of(context).size.height*0.07,
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text("${widget.yemek.yemek_fiyat} ₺",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(13)),
                  color: turuncu,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: acikTuruncu,// Shadow position
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width*0.4,
                height: MediaQuery.of(context).size.height*0.07,
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: (){
                        setState(() {
                          if (siparisAdet>0) siparisAdet--;
                        });
                      },
                      icon: const Icon(Icons.remove_circle_outline_rounded,color: Colors.white,),
                      iconSize: 40,
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Text("$siparisAdet",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),),
                    ),
                    IconButton(
                      onPressed: (){
                        setState(() {
                          siparisAdet++;
                        });
                      },
                      icon:const Icon(Icons.add_circle_outline_rounded,color: Colors.white,),
                      iconSize: 40,
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:const Color(0xFFF9A826),
                  fixedSize: Size(size.width*0.95, size.height*0.08),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                onPressed: (){
                  if (siparisAdet>0){
                    context.read<YemekDetayCubit>().ekle(widget.yemek.yemek_adi, widget.yemek.yemek_resim_adi, widget.yemek.yemek_fiyat, siparisAdet, widget.kullanici.kullanici_ad );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Ürün sepete eklendi."),
                      ),
                    );
                    Navigator.pop(context);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Ürün adeti seçiciniz."),
                        action: SnackBarAction(
                            label: "TAMAM",
                            onPressed: (){
                            }
                        ),
                      ),
                    );
                  }
                },
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.shopping_basket_outlined,color: Colors.white,),
                    Text("Sepete Ekle",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                  ],
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
