import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/colors.dart';
import 'package:food_order_app/cubit/yemek_sepet_cubit.dart';
import 'package:food_order_app/entity/kullanicilar.dart';
import 'package:food_order_app/entity/sepet_yemekler.dart';
import 'package:google_fonts/google_fonts.dart';

class YemekSepetSayfa extends StatefulWidget {
  Kullanicilar kullanici;


  YemekSepetSayfa({required this.kullanici});

  @override
  State<YemekSepetSayfa> createState() => _YemekSepetSayfaState();
}

class _YemekSepetSayfaState extends State<YemekSepetSayfa> {

  @override
  void initState() {
    super.initState();
    context.read<YemekSepetCubit>().sepettekiYemekleriGetir(widget.kullanici.kullanici_ad);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepet",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
        backgroundColor: turuncu,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: BlocBuilder<YemekSepetCubit,List<SepetYemekler>>(
        builder: (context,sepetYemeklerListesi){

          if(sepetYemeklerListesi.isNotEmpty){
            return ListView.builder(
              itemCount: sepetYemeklerListesi.length,
              itemBuilder: (context,indeks){
                var sepet = sepetYemeklerListesi[indeks];
                return Column(
                  children: [
                    Card(
                      child: Row(
                        children: [
                          SizedBox(width: 100,height: 100,
                              child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${sepet.yemek_resim_adi}")),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("${sepet.yemek_adi} ",style: GoogleFonts.quicksand(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                                Text("${sepet.yemek_siparis_adet} Adet",style: GoogleFonts.quicksand(color: Colors.black,fontSize: 15),),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text("${sepet.yemek_fiyat*sepet.yemek_siparis_adet} ₺",style: GoogleFonts.quicksand(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${sepet.yemek_adi} silinsin mi"),
                                action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: (){
                                      context.read<YemekSepetCubit>().sepettenYemekSil(sepet.sepet_yemek_id, widget.kullanici.kullanici_ad);
                                    }
                                ),
                              ),
                            );
                          }, icon: const Icon(Icons.delete_outline_outlined,color: Colors.red,))
                        ],
                      ),
                    ),
                    indeks == sepetYemeklerListesi.length-1 ?
                    const SizedBox(height: 80,) :
                    const SizedBox(height: 0,),
                  ],
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: BlocBuilder<YemekSepetCubit,List<SepetYemekler>>(
        builder: (context,sepetYemeklerListesi){
          int toplamTutar=0;

          if(sepetYemeklerListesi.isNotEmpty){
            for( var yemek in sepetYemeklerListesi){
              toplamTutar+=yemek.yemek_siparis_adet*yemek.yemek_fiyat;
            }
            return FloatingActionButton.extended(
              onPressed: (){},
              icon: Icon(Icons.payment_rounded),
              label: Text("Toplam : $toplamTutar ₺",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
              backgroundColor: turuncu,
            );
          }else{
            return const Center();
          }
        },
      ),
    );
  }
}