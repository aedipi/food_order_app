import 'package:flutter/material.dart';
import 'package:food_order_app/colors.dart';
import 'package:food_order_app/entity/kullanicilar.dart';
import 'package:food_order_app/views/anasayfa.dart';
import 'package:food_order_app/views/profil_sayfa.dart';
import 'package:food_order_app/views/yemek_sepet_sayfa.dart';

class NavigationSayfa extends StatefulWidget {
  Kullanicilar kullanici;
  NavigationSayfa({required this.kullanici});

  @override
  State<NavigationSayfa> createState() => _NavigationSayfaState();
}

class _NavigationSayfaState extends State<NavigationSayfa> {
  int _secikenIndeks = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> sayfaListesi = [Anasayfa(kullanici: widget.kullanici),YemekSepetSayfa(kullanici: widget.kullanici),ProfilSayfa(kullanici: widget.kullanici)];
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          sayfaListesi[_secikenIndeks],
          const SizedBox(height: 90,),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (builder) => sayfaListesi[1]));
                    },
                    backgroundColor: turuncu,
                      elevation: 0.1,
                      child: const Icon(Icons.shopping_cart_outlined),),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: (){
                          setState(() {
                            _secikenIndeks = 0;
                          });
                        }, icon: const Icon(Icons.food_bank_outlined,size: 30,),color: _secikenIndeks == 0 ? turuncu : Colors.grey.shade400),
                        SizedBox(width: size.width*0.35,),
                        IconButton(onPressed: (){
                          setState(() {
                            _secikenIndeks=2;
                          });
                        }, icon: const Icon(Icons.person_outline_rounded,size: 30,),color: _secikenIndeks == 2 ? turuncu : Colors.grey.shade400,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}