import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/colors.dart';
import 'package:food_order_app/cubit/profil_cubit.dart';
import 'package:food_order_app/entity/kullanicilar.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilSayfa extends StatefulWidget {
  Kullanicilar kullanici;
  ProfilSayfa({required this.kullanici});

  @override
  State<ProfilSayfa> createState() => _ProfilSayfaState();
}

class _ProfilSayfaState extends State<ProfilSayfa> {
  var tfKullaniciAd = TextEditingController();
  var tfKullaniciEmail = TextEditingController();
  var tfKullaniciSifre = TextEditingController();
  bool sifreGosteriliyorMu = false;

  @override
  void initState() {
    super.initState();
    tfKullaniciAd.text = widget.kullanici.kullanici_ad;
    tfKullaniciEmail.text = widget.kullanici.kullanici_email;
    tfKullaniciSifre.text = widget.kullanici.kullanici_sifre;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: turuncu,
        title: Text("Profil",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,),),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: size.width*0.1,right: size.width*0.1),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height*0.05,),
                  Text("Kullanıcı Adı",style: GoogleFonts.quicksand(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                  TextField(
                    controller: tfKullaniciAd,
                    decoration: InputDecoration(
                      hintText: "Kullanıcı Adı, Ör: jdoe",
                      hintStyle: GoogleFonts.quicksand(fontSize: 15,),
                    ),
                  ),
                  SizedBox(height: size.height*0.05,),
                  Text("Email",style: GoogleFonts.quicksand(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                  TextField(
                    controller: tfKullaniciEmail,
                    decoration: InputDecoration(
                      hintText: "Email Adresiniz, Ör: jhondoe@example.com",
                      hintStyle: GoogleFonts.quicksand(fontSize: 15,),
                    ),
                  ),
                  SizedBox(height: size.height*0.05,),
                  Text("Şifre",style: GoogleFonts.quicksand(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                  TextField(
                    controller: tfKullaniciSifre,
                    obscureText: !sifreGosteriliyorMu,
                    decoration: InputDecoration(
                      hintText: "Şifreniz, en az 8 karakter",
                      hintStyle: GoogleFonts.quicksand(fontSize: 15,),
                      suffixIcon: IconButton(onPressed: (){
                        setState((){
                          sifreGosteriliyorMu=!sifreGosteriliyorMu;
                        });

                      },icon:Icon(sifreGosteriliyorMu ? Icons.visibility_off : Icons.visibility,)),
                    ),
                  ),
                  SizedBox(height: size.height*0.05,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:const Color(0xFFF9A826),
                      fixedSize: Size(size.width, size.height*0.08),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    onPressed: (){
                      context.read<ProfilCubit>().guncelle(widget.kullanici.kullanici_id, tfKullaniciAd.text,tfKullaniciEmail.text, tfKullaniciSifre.text);

                    }, child: Text("Güncelle",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),),
                  SizedBox(height: 100,),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
