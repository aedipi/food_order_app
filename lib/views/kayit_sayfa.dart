import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/colors.dart';
import 'package:food_order_app/cubit/kayit_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({Key? key}) : super(key: key);

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfKullaniciAd = TextEditingController();
  var tfKullaniciEmail = TextEditingController();
  var tfKullaniciSifre = TextEditingController();
  var tfKullaniciSifreTekrar = TextEditingController();
  bool sifreGosteriliyorMu = false;
  bool sifreTekrarGosteriliyorMu = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF9A826),
      body: Stack(
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
            child: Text("Kayıt Ol",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
          ),
          Positioned(
            left: size.width*0.03,
            top: size.height*0.05,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: size.width*0.3,
                height: size.height*0.05,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: acikTuruncu,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.white70,
                      offset: Offset(4, 8), // Shadow position
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios_new_outlined,size: 20,color: Colors.white,),
                    Text("Giriş Yap",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 20),),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: size.height*0.65,
                padding: EdgeInsets.only(left: size.width*0.05,right: size.width*0.02,bottom: size.width*0.03,top: size.width*0.05),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  color: Colors.white
                ),
                child: Scrollbar(
                  radius: Radius.circular(50),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
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

                              },icon:Icon(sifreGosteriliyorMu ? Icons.visibility : Icons.visibility_off,),),
                            ),
                          ),
                          SizedBox(height: size.height*0.05,),
                          Text("Şifre Tekrar",style: GoogleFonts.quicksand(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                          TextField(
                            controller: tfKullaniciSifreTekrar,
                            obscureText: !sifreTekrarGosteriliyorMu,
                            decoration: InputDecoration(
                                hintText: "Şifrenizi Tekrar Giriniz",
                              hintStyle: GoogleFonts.quicksand(fontSize: 15,),
                              suffixIcon: IconButton(onPressed: (){
                                setState((){
                                  sifreTekrarGosteriliyorMu=!sifreTekrarGosteriliyorMu;
                                });
                              },icon:Icon(sifreTekrarGosteriliyorMu ? Icons.visibility : Icons.visibility_off,)),
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
                              if (tfKullaniciSifre.text.length>=8){
                                if(tfKullaniciSifre.text==tfKullaniciSifreTekrar.text){
                                  context.read<KayitCubit>().kayit(tfKullaniciAd.text,tfKullaniciEmail.text, tfKullaniciSifre.text);
                                  print("kayit olundu");
                                }else{
                                  // TODO: uyarı mesajı verilecek
                                  print("şifreler uyuşmuyor");
                                }
                              }else{
                                print("şifreniz en az 8 karakter olmalı");
                              }

                            }, child: Text("Kayıt Ol",style: GoogleFonts.quicksand(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),),
                          SizedBox(height: size.height*0.03,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
