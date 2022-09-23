import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/cubit/giris_cubit.dart';
import 'package:food_order_app/entity/kullanicilar.dart';
import 'package:food_order_app/views/navigation_sayfa.dart';
import 'package:google_fonts/google_fonts.dart';

import 'kayit_sayfa.dart';

class GirisSayfa extends StatefulWidget {
  const GirisSayfa({Key? key}) : super(key: key);

  @override
  State<GirisSayfa> createState() => _GirisSayfaState();
}

class _GirisSayfaState extends State<GirisSayfa> {
  var tfKullaniciAd = TextEditingController();
  var tfKullaniciSifre = TextEditingController();
  bool _sifreGosteriliyorMu = false;


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF9A826),
      body: BlocListener<GirisCubit,Kullanicilar>(
        listener: (context,kullanici){
          if(kullanici.kullanici_ad==tfKullaniciAd.text && kullanici.kullanici_sifre==tfKullaniciSifre.text){
            Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationSayfa(kullanici: kullanici)));
          }
        },
        child: Stack(
          children: [
            Positioned(
              left: size.width*0.57,
              bottom: size.height*0.7,
              child: CircleAvatar(
                radius: size.width*0.4,
                backgroundColor: const Color(0xFFFFB133),
              ),
            ),
            Positioned(
              left: size.width*0.03,
              bottom: size.height*0.62,
              child: CircleAvatar(
                radius: size.width*0.1,
                backgroundColor: const Color(0xFFFFB133),
              ),
            ),
            Positioned(
              left: size.width*0.15,
              top: size.height*0.15,
              child: Text("Giriş Yap",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: size.height*0.65,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                    color: Colors.white
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: size.width*0.05,right: size.width*0.05, top: size.width*0.1),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Kullanıcı Adı",style: GoogleFonts.quicksand(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                      TextField(
                        controller: tfKullaniciAd,
                        decoration: InputDecoration(
                          hintText: "Kullanıcı Adınızı Giriniz",
                          hintStyle: GoogleFonts.quicksand(fontSize: 15,),
                        ),
                      ),
                      Text("Şifre",style: GoogleFonts.quicksand(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                      TextField(
                        controller: tfKullaniciSifre,
                        obscureText: !_sifreGosteriliyorMu,
                        decoration: InputDecoration(
                          hintText: "Şifrenizi Giriniz",
                          hintStyle: GoogleFonts.quicksand(fontSize: 15,),
                          suffixIcon: IconButton(onPressed: (){
                            setState((){
                              _sifreGosteriliyorMu=!_sifreGosteriliyorMu;
                            });

                          },icon:Icon(_sifreGosteriliyorMu ? Icons.visibility : Icons.visibility_off,)),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary:const Color(0xFFF9A826),
                          fixedSize: Size(size.width, size.height*0.08),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        onPressed: (){
                          context.read<GirisCubit>().kullanicilariGetir(tfKullaniciAd.text, tfKullaniciSifre.text);

                        }, child: Text("Giriş Yap",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),),
                      TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const KayitSayfa()));
                        },
                        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Hesabınız yok mu ? ",style: GoogleFonts.quicksand(color: Colors.black54,fontSize: 15,fontWeight: FontWeight.w600),),
                            Text("Kayıt Ol",style: GoogleFonts.quicksand(color: const Color(0xFFF9A826),fontSize: 15,fontWeight: FontWeight.w600),),
                          ],
                        ),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
